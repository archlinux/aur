# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Michael Asher < asherlm at gmail dot com > 
#
pkgname=libsmi
pkgver=0.5.0
pkgrel=2
pkgdesc="C library allowing NM apps and MIB and PIB authoring tools to access SMI MIB info." 
arch=('i686' 'x86_64')
url="http://www.ibr.cs.tu-bs.de/projects/libsmi/"
license=('Custom')
depends=('bash')
source=("https://www.ibr.cs.tu-bs.de/projects/${pkgname}/download/${pkgname}-${pkgver}.tar.gz"
				'LICENSE')
sha512sums=('be82e6b7054426e4634ac9d90467b89a51a9c836273c9d516f07ff3cec3a8dcc8b3bb0e0396d5facec3d9c952b17fb67f24ff2d3959e7e5cf9eced72023a0708'
            '51121f9dfc80a8fe13392aa98e75c43d312c65f5a7c86d364f3efff9d713f0f455e6040bbe82f1e38e796b316b4dcb6c98d3e8dfa16d751944751dc0fcd0c74e')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make V=0
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
	install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2:


