# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Contributor: tee < teeaur at duck dot com >
# Maintainer: tblFlip <root@tblflip.de>
_pkgname=surrealdb
pkgname="${_pkgname}-bin"
pkgver=3.1.5
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
	"f7d515203ba0010bde3fc6a5706ce7327d356aca293fbba8424d442f5dcb5002"
)

sha256sums_aarch64=(
	"a39dfa845b1db9777d70c2ebad2de0b6637eda66e0bb1808aaee1362855345b1"
)

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4:
