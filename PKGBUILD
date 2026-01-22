# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Contributor: tee < teeaur at duck dot com >
# Maintainer: tblFlip <root@tblflip.de>
_pkgname=surrealdb
pkgname="${_pkgname}-bin"
pkgver=2.5.0
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64' 'aarch64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
depends=('gcc-libs')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$url/releases/download/v${pkgver//_/-}/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver//_/-}/surreal-v${pkgver//_/-}.linux-amd64.tgz")
source_aarch64=("$url/releases/download/v${pkgver//_/-}/surreal-v${pkgver//_/-}.linux-arm64.tgz")
sha256sums=('dd98c688e54be8b85ad79e603f5112449b9789dfc031db94eb5c7dc843702aef')
sha256sums_x86_64=('3d5a3a1fbfea5672561ac9108e1d317ec6a65f86d72d823e2ead1759b8b2ce9b')
sha256sums_aarch64=('e3159ea8938adaf7a8c3d687284a8e9c335ebadce8d2f7c5591da68b90365bdb')

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4:
