# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: Sheikh Limon <sheikhlimon404@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=goose-cli-bin
pkgver=1.59.2
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
b2sums=('37678c71f355316f0faa78afee70cc3ac8385a399ce1cc127b27c3efe69ec132475a60e7e2eeca2b3566dd275d055acb8db8c0041dcc36961f4c2985db6c4f4c'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

build() { :; }

package() {
	tar -xjf "${srcdir}/goose-cli-${pkgver}.tar.bz2" -C "${srcdir}"
	install -Dm755 "${srcdir}/goose" "${pkgdir}/usr/bin/goose"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
