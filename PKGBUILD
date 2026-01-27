# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>
# Contributor: tee < teeaur at duck dot com >
# Maintainer: tblFlip <root@tblflip.de>
_pkgname=surrealdb
pkgname="${_pkgname}-bin"
pkgver=2.6.0
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
sha256sums_x86_64=('99e1d0765e977e37d5e9940a3e553f6910fab7f830b4dbc42052fd45597ae265')
sha256sums_aarch64=('c31d16b1dca5a6aaf6d780071b5c42f80a24f1c1689ba6c8bb559d4d39175276')

package() {
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${srcdir}/surreal" "${pkgdir}/usr/bin/surreal"
}
# vim:set noet sts=0 sw=4 ts=4:
