# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.6.3
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("amtk" "libkeybinder3" "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8c22aedf839518fa4d4a82bfab4c6efee9c3054a4bc0d3f1bb1a7434ce843c5c')

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
