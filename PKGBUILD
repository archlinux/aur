# Maintainer: Oliver Anhuth <oliver.anhuth at zoho.com>

pkgname=envview
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple graphical viewer for (inherited) environment variables"
arch=("i686" "x86_64")
url="https://github.com/oliver-anhuth/envview"
license=("MIT")
depends=("qt5-base")
makedepends=("qt5-base" "gcc-multilib")
source=("$pkgname-$pkgver.tar.gz::https://github.com/oliver-anhuth/envview/archive/1.0.0.tar.gz")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make -f install.make DESTDIR="${pkgdir}" install
}
