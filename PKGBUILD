# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.6.1
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("amtk" "libkeybinder3" "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f71e8b5a843b53ca24ec93da2c9c402a71ac2a594434636a83a6b8fd5937f228')

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
