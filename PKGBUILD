# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Julian Knauer <jpk@goatpr0n.de>

pkgname=sieve-connect
pkgver=0.87
pkgrel=3
pkgdesc="Client for the MANAGESIEVE protocol"
arch=('any')
url="http://people.spodhuis.org/phil.pennock/software/"
license=('GPL')
depends=('perl-authen-sasl' 'perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-net-dns' 'perl-term-readkey')
optdepends=('perl-term-readline')
provides=('sieve-connect')
validpgpkeys=('7F3DFA55DD3C9BC81889773B403043153903637F')
source=("http://people.spodhuis.org/phil.pennock/software/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('e3de80ab34994de0277fc7bf53b7c08e82db1a1f2762ddac4311d8191cea6c49'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 sieve-connect ${pkgdir}/usr/bin/sieve-connect
	install -D -m0644 sieve-connect.1 ${pkgdir}/usr/share/man/man1/sieve-connect.1
}

