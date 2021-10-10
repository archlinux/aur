# Maintainer: François Grabenstaetter <francoisgrabenstaetter@gmail.com>

pkgname=digital-assets
pkgver=2.0.0
pkgrel=1
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
source=("git+$url.git#tag=$pkgver")
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
