# Maintainer: François Grabenstaetter <francoisgrabenstaetter@gmail.com>

pkgname=digital-assets
pkgver=1.2.0
pkgrel=1
pkgdesc="Cryptocurrencies prices and statistics"
arch=('any')
url="https://gitlab.gnome.org/fgrabenstaetter/$pkgname"
license=('GPL3')

depends=(
    'python>=3.7'
    'glib2'
    'gtk3>=3.20'
    'gobject-introspection>=1.56'
    'python-cairo'
)
makedepends=(
    'git'
    'meson>=0.50'
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
