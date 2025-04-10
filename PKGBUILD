# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
_pkgname=surrealdb
pkgname=${_pkgname}-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
depends=('gcc-libs')
provides=(${_pkgname})
conflicts=(${_pkgname})
_LICENSE=LICENSE_${pkgver}
source=("${_LICENSE}::https://github.com/surrealdb/surrealdb/releases/download/v${pkgver//_/-}/LICENSE" "https://github.com/surrealdb/surrealdb/releases/download/v${pkgver//_/-}/surreal-v${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef' 'bf0e3a436296e7a462b77e53ea8dd4742b030c2a65b5dad980f980202ff16d36')

package() {
	install -Dm644 "${srcdir}/${_LICENSE}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
