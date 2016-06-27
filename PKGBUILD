# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mod_asn
pkgdesc='an apache module to look up routing data'
pkgver=1.6
pkgrel=2
arch=('i686' 'x86_64')
license=('Apache')
depends=('apache' 'postgresql-ip4r')
validpgpkeys=('2571453148894D38C683E1E2F49DC584BF8B088D') # Peter Poeml <poeml@cmdline.net>
source=("http://mirrorbrain.org/files/releases/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('00b2a9cd5dd5d700cdf3fb96a95000771a433de7a95c45e72b53aebb511cef9a'
            'SKIP')

build() {
	cd "${pkgname}-${pkgver}/"

	apxs -c mod_asn.c
}

package() {
	cd "${pkgname}-${pkgver}/"

	install -D -m0755 .libs/mod_asn.so "${pkgdir}"/usr/lib/httpd/modules/mod_asn.so
}

