# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Contributor: tee < teeaur at duck dot com >
# Maintainer: tblFlip <root@tblflip.de>
_pkgname=surrealdb
pkgname="${_pkgname}-bin"
pkgver=3.1.3
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
	"38acb60d94d2a061e9c135b63f313402780d9edc3c7120daa39dcd3a37f80deb"
)

sha256sums_aarch64=(
	"3ff91e392a784aad1b1d7f7e6f2320b3ca57e3b122542be21bf8466d12d60ed2"
)

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4:
