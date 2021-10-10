# Maintainer: François Grabenstaetter <francoisgrabenstaetter@gmail.com>

pkgname=digital-assets
pkgver=2.0.0
pkgrel=2
pkgdesc="Cryptocurrencies prices and statistics"
arch=('any')
url="https://gitlab.gnome.org/fgrabenstaetter/$pkgname"
license=('GPL3')

depends=(
    'python3'
    'glib2'
    'gtk4'
    'gobject-introspection'
    'python-cairo'
)
makedepends=(
    'git'
    'meson'
)
source=("git+$url.git#commit=2b2b010e8f227da9e98ff63b2eb7b504b65ae0b6")
sha256sums=('SKIP')

build() {
    cd $pkgname
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" ninja -C build install
}
