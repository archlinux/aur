# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Julian Knauer <jpk@goatpr0n.de>

pkgname=sieve-connect
pkgver=0.90
pkgrel=1
pkgdesc="Client for the MANAGESIEVE protocol"
arch=('any')
url="http://people.spodhuis.org/phil.pennock/software/"
license=('GPL')
depends=('perl-authen-sasl' 'perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-net-dns' 'perl-term-readkey')
optdepends=('perl-term-readline')
provides=('sieve-connect')
validpgpkeys=('ACBB4324393ADE3515DA2DDA4D1E900E14C1CC04') # Phil Pennock <phil.pennock@spodhuis.org>
source=("https://people.spodhuis.org/phil.pennock/software/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('4a188ba50009170b5a7a51cbd0dbaab972eb1e42a3ad7c2d8d22fb63f2f77603'
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

