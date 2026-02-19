# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=kilocode-cli-bin
pkgver=1.0.23 # datasource=npm depName=@kilocode/cli
pkgrel=2
pkgdesc='The all-in-one agentic engineering platform.'
arch=('aarch64' 'x86_64')
depends=('glibc')
url='https://kilo.ai/cli'
license=('MIT')
options=('!strip')
provides=('kilo')

_url="https://github.com/Kilo-Org/kilo"

source_aarch64=("kilocode-aarch64-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/kilo-linux-arm64.tar.gz")
source_x86_64=("kilocode-x86_64-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/kilo-linux-x64-baseline.tar.gz")
source=("LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")

sha256sums=('0d23876a7b5c9a875091466d03091524ebc2b3f48f9f5725cbb9eee9d6c6c2af')
sha256sums_aarch64=('0062abd95e55bd28b4c11d71e6f0821fba9a2b267ab8eff4083188298618e039')
sha256sums_x86_64=('04947f8307bd777cd1e3468c8862930ebfae9903d441bc2cc3fb04b87bb41429')

package() {
	install -Dm755 "${srcdir}/kilo" "${pkgdir}/usr/bin/kilo"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
