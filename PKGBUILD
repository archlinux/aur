# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=smemstat
pkgver=0.02.13
pkgrel=2
pkgdesc="Smemstat reports the physical memory usage taking into consideration shared memory."
arch=("any")
url="https://github.com/ColinIanKing/smemstat"
license=("GPL-2.0-or-later")
depends=("ncurses")
makedepends=("gcc" "make")
provides=("smemstat")
conflicts=("smemstat")
source=("https://github.com/ColinIanKing/${pkgname}/archive/V${pkgver}.tar.gz")
b2sums=('fddebcf5cc602d8542cf27284797d9addd92b92e99671cecbf1f78f55eff7d679bc17e2602c816c92a25e6310365a985579629242fc46d2fad195930fd4aab99')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir" BINDIR="/usr/bin"
}
