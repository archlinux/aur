# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Contributor: tee < teeaur at duck dot com >
# Maintainer: tblFlip <root@tblflip.de>
_pkgname=surrealdb
pkgname="${_pkgname}-bin"
pkgver=3.2.0
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

sha256sums=(
	"98a94ac615f88370865016487b436fa404560910bd329794ed7502277a94b805"
)

sha256sums_x86_64=(
	"9c0a9ae29444f3b144a1261fc923116b0e10a3cbadc478cabc9009b3beb9bb3a"
)

sha256sums_aarch64=(
	"8dc83157d74d906e573d80b0c33c6fb80185ceb58c9553ea1768b8d7b4c7703c"
)

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4:
