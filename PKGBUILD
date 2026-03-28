# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=kilocode-cli-bin
pkgver=7.1.9 # datasource=github-releases depName=Kilo-Org/kilocode
pkgrel=1
pkgdesc='The all-in-one agentic engineering platform.'
arch=('aarch64' 'x86_64')
depends=('glibc')
url='https://kilo.ai/cli'
license=('MIT')
options=('!strip')
provides=('kilo')

_url="https://github.com/Kilo-Org/kilocode"

source_aarch64=("kilocode-aarch64-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/kilo-linux-arm64.tar.gz")
source_x86_64=("kilocode-x86_64-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/kilo-linux-x64-baseline.tar.gz")
source=("LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")

sha256sums=('0d23876a7b5c9a875091466d03091524ebc2b3f48f9f5725cbb9eee9d6c6c2af')
sha256sums_aarch64=('a4a1c03d2e6308357563d16396884e4ce6370984f7e32807a5a42ee377736aea')
sha256sums_x86_64=('bd3ad94fc447725e985fdaabf7bfadbca657ead2353a7b143bc915e990a585c9')

package() {
	install -Dm755 "${srcdir}/kilo" "${pkgdir}/usr/bin/kilo"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
