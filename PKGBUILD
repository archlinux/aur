pkgname=axonhub-bin
_realver="1.0.0-rc.4"
pkgver="${_realver//[-+]/_}"
pkgrel=1
pkgdesc='Open-source AI Gateway — Use any SDK to call 100+ LLMs. Built-in failover, load balancing, cost control and end-to-end tracing.'
arch=('x86_64' 'aarch64')
url='https://github.com/looplj/axonhub'
license=('Apache-2.0' 'LGPL-3.0')
_allow_prerelease=1
provides=('axonhub')
conflicts=('axonhub')
options=('!strip')

source_x86_64=("axonhub-${_realver}.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_amd64.zip")
source_aarch64=("axonhub-${_realver}.zip::https://github.com/looplj/axonhub/releases/download/v${_realver}/axonhub_${_realver}_linux_arm64.zip")

sha256sums_x86_64=('a60006e0dab315720875d3ebf39138dee63bbdaa64e44e040135e7c9df97cf5c')
sha256sums_aarch64=('a14e1d5f5365749ac1c7f18fddde70bd6119a26ac7dc3f3d5dc2a57295131379')

package() {
  cd "${srcdir}"

  install -Dm755 axonhub "${pkgdir}/usr/bin/axonhub"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
