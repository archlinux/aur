# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
_pkgname=surrealdb
pkgname=${_pkgname}-bin
pkgver=2.0.2
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
sha256sums=('dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef' '5aac6d62813d630fd85f45f2a4eaa878d68eb6becf270c3cafb224bc9eba0669')

package() {
	install -Dm644 "${srcdir}/${_LICENSE}" "${pkgdir}/usr/share/licenses/${_pkgname}"

	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
