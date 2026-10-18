# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: Sheikh Limon <sheikhlimon404@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=goose-cli-bin
pkgver=1.55.0
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
b2sums=('86e015c5150c7f723cff140939672eeaf184c212c9da5bb00f5d0f0452a1ca14ac5828848eab742813a4f1abe15092bef0037d32abf33658f9b67979fd017a37'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

build() { :; }

package() {
	tar -xjf "${srcdir}/goose-cli-${pkgver}.tar.bz2" -C "${srcdir}"
	install -Dm755 "${srcdir}/goose" "${pkgdir}/usr/bin/goose"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
