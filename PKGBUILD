# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.7.2
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("libkeybinder3" "gst-plugins-base" "gst-plugins-bad" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('5f96ba7b8654f331181c8ee0e697d042a195406712a547e7954159e5d66795ba')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    meson --prefix=/usr build
    cd build
    ninja
}

package() {
    cd "$srcdir/$pkgname-v$pkgver/build"
    DESTDIR="$pkgdir" ninja install
}
