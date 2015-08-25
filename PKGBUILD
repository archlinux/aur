# Contributor:	Arto Jonsson	<kapsi.fi: ajonsson>
# Contributor:	andrewy		<andrewyates.net: andrew>
# Maintainer:	Jesse Jaara	<gmail: jesse.jaara>

pkgname=memtester
pkgver=4.3.0
pkgrel=1
pkgdesc="A userspace utility for testing the memory subsystem for faults"
arch=('i686' 'x86_64')
url="http://pyropus.ca/software/memtester/"
license=('GPL2')
depends=('glibc')
source=(http://pyropus.ca/software/memtester/old-versions/$pkgname-$pkgver.tar.gz)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m755 memtester "${pkgdir}/usr/bin/memtester"
    install -D -m644 memtester.8 "${pkgdir}/usr/share/man/man8/memtester.8"
}

md5sums=('598f41b7308e1f736164bca3ab84ddbe')
