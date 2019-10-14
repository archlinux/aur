# Maintainer: fs4000 <matthias_dienstbier[at]yahoo[dot]de>

pkgname=libchipcard
pkgver=5.0.4
pkgrel=1
pkgdesc="A library for easy access to chip cards via chip card readers"
arch=('i686' 'x86_64')
url="http://www.libchipcard.de/"
license=('GPL2')
depends=('gwenhywfar' 'pcsclite')
source=("$pkgname-$pkgver.tar.gz::https://www.aquamaniac.de/rdm/attachments/download/158/$pkgname-$pkgver.tar.gz")
sha256sums=('d25a79adcf09f1058ca9168b80e843fadbd556fb0f23c890d871124ad380423a')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

check() {
    cd $pkgname-$pkgver
    make -k check
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
