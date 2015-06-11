# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cerberus-securetty
pkgver=1428445363
pkgrel=1
pkgdesc="securetty support for cerberus"
url="https://github.com/GNU-Pony/cerberus-securetty"
arch=(i686 x86_64)
license=(GPL3)
depends=(grep coreutils sh)
makedepends=(make coreutils texinfo)
install=cerberus-securetty.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(b63ed4b5f60b1c9731a801da01f8b04484cd930c78a56a264096d60594642fc8)

build() {
	cd "${srcdir}/cerberus-securetty-${pkgver}"
	
	make PKGNAME="${pkgname}"
}

package() {
	cd "${srcdir}/cerberus-securetty-${pkgver}"
	
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

