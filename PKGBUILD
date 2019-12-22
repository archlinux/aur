# Maintainer: François Grabenstaetter <francoisgrabenstaetter@gmail.com>

pkgname=digital-assets
pkgver=1.1.1
pkgrel=1
pkgdesc="Cryptocurrencies prices and statistics"
arch=('any')
url="https://gitlab.gnome.org/fgrabenstaetter/digital-assets"
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
source=('git+https://gitlab.gnome.org/fgrabenstaetter/digital-assets.git#tag=7a70f071caa3ac45c82f596f5f1a73ffd67c43ca')
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
