# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.4.2
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("libkeybinder3" "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('aaa2650ee330e7b4cb97d9783ac8d2e5fbadd0af339a562638acebe674045fa1')

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
