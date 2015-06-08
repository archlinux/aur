# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Marek Wardzinski <emvi@emvi.NO.eu.SPAM.org>
# Contributor: Bartosz Dusilo <cbreaker@tlen.pl>
pkgname=ant
pkgver=0.1.1
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="GTK+ based network tool to grapchical creating TCP/IP frames."
url=("http://ant.sourceforge.net/")
license=('GPL')
changelog=ChangeLog
depends=('gtk2' 'libnet' 'libpcap')
source=("http://downloads.sourceforge.net/ant/ant-${pkgver}.tar.bz2")
sha256sums=('a886a3aa329f37db82f58207291cbb950a781b1da443a8064963e545cf894232')

build() {
    cd "${srcdir}/${pkgname}"
    LDFLAGS+=" -lm" make
}

package() {
    install -Dm 755 "${srcdir}/ant/ant" "${pkgdir}/usr/bin/ant_mw"
}

