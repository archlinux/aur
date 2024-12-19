# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
_pkgname=surrealdb
pkgname=${_pkgname}-bin
pkgver=2.1.4
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
sha256sums=('dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef' '09b89798a07d79d9b105131bc6958d4da496aad2040bf1a292e7c9d7c92abc80')

package() {
	install -Dm644 "${srcdir}/${_LICENSE}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
