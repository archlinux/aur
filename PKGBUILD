# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=kilocode-cli-bin
pkgver=7.0.39 # datasource=github-releases depName=Kilo-Org/kilocode
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
sha256sums_aarch64=('ef2e40594f42cb29aa71b6e88a5a504a0875f6dc1db918572a6c5c8a88adf752')
sha256sums_x86_64=('66cc63e0bee63d64f3223b509ba9de1a32abff34994bbbade23058d2d9b4f141')

package() {
	install -Dm755 "${srcdir}/kilo" "${pkgdir}/usr/bin/kilo"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
