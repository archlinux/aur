# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: Sheikh Limon <sheikhlimon404@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=goose-cli-bin
pkgver=1.53.0
pkgrel=1
pkgdesc='An open source, extensible AI agent that goes beyond code suggestions (CLI)'
arch=('x86_64')
url='https://github.com/aaif-goose/goose'
license=('Apache-2.0')
provides=('goose-cli')
conflicts=('goose-cli' 'goose-desktop')
depends=(
	'glibc'
	'gcc-libs'
	'libgcc'
	'libstdc++'
	# Used by webbrowser crate for OAuth
	'xdg-utils'
)
options=('!strip')
source=(
	"goose-cli-${pkgver}.tar.bz2::https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose-${CARCH}-unknown-linux-gnu.tar.bz2"
	'LICENSE::https://raw.githubusercontent.com/aaif-goose/goose/refs/heads/main/LICENSE'
)
b2sums=('f97cc036ecde3ef8659aa97cd927d839eff86c8289e254bfe6bed01a004d5b5de0f09b585106100900e68a068e78fe8cc0ff6a7514471e3dc39760f694013bc7'
	'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

build() { :; }

package() {
	tar -xjf "${srcdir}/goose-cli-${pkgver}.tar.bz2" -C "${srcdir}"
	install -Dm755 "${srcdir}/goose" "${pkgdir}/usr/bin/goose"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
