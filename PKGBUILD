# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Constantinko <helllamer@gmail.com>

pkgname=httpfs2
pkgver=0.1.5
pkgrel=3
pkgdesc='FUSE-based file system for HTTP access'
arch=('i686' 'x86_64')
url='http://httpfs.sourceforge.net/'
license=('GPL')
depends=('fuse' 'openssl')
makedepends=('asciidoc' 'dpkg')
source=("http://downloads.sourceforge.net/project/httpfs/httpfs2/${pkgname}-${pkgver}.tar.gz")
sha256sums=('01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -D -m0755 httpfs2 ${pkgdir}/usr/bin/httpfs2
	install -D -m0755 httpfs2-ssl ${pkgdir}/usr/bin/httpfs2-ssl

	install -D -m0644 httpfs2.1 ${pkgdir}/usr/share/man/man1/httpfs2.1

	install -D -m0644 debian/copyright ${pkgdir}/usr/share/doc/httpfs2/copyright
}

