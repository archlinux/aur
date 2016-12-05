# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Julian Knauer <jpk@goatpr0n.de>

pkgname=sieve-connect
pkgver=0.88
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
sha256sums=('b8b0146120d76de7407017573d695680b9cae5fc4d9974f4a7cbf166328a3872'
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

