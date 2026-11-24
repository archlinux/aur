pkgname=axonhub-bin
_realver="1.0.0-rc.5"
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

sha256sums_x86_64=('537512fe17c01ad917d702c12de33386563df2d3f1ffd6f4cf96bb26fd3ed3d4')
sha256sums_aarch64=('6ded5fd2cd129fb2eb1c935bd753c9423d251491f4344ce7aaab86cc633be08e')

package() {
  cd "${srcdir}"

  install -Dm755 axonhub "${pkgdir}/usr/bin/axonhub"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
