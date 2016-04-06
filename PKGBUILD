# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Contributor:	Arto Jonsson	<kapsi.fi: ajonsson>
# Contributor:	andrewy		<andrewyates.net: andrew>
# Past maintainer:	Jesse Jaara	<gmail: jesse.jaara>

pkgname=memtester
pkgver=4.3.0
pkgrel=3
pkgdesc="A userspace utility for testing the memory subsystem for faults"
arch=('i686' 'x86_64')
url="http://pyropus.ca/software/memtester/"
license=('GPL2')
depends=('glibc')
source=(http://pyropus.ca/software/memtester/old-versions/${pkgname}-${pkgver}.tar.gz)
sha512sums=('045bcc73855706ff03e8ca65297a0d6e5b5ac02f99dae0f17cef1310b403efcb78d9a7295eca6d2de703b0a7b2f71b58a37f5a42040f01fc77a321a8d2205888')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -m755 memtester "${pkgdir}/usr/bin/memtester"
    install -D -m644 memtester.8 "${pkgdir}/usr/share/man/man8/memtester.8"
}

