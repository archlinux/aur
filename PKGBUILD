# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=swarm-cronjob-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Time-based job scheduling for Docker Swarm"
arch=('x86_64' 'aarch64')
url="https://github.com/crazy-max/swarm-cronjob"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/swarm-cronjob_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/swarm-cronjob_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('086a461599ddbd38296ffc8f97ee2568e8e97cf7756dd3bf85cebd02ad71301f')
sha256sums_aarch64=('631e517794a52e592e1f5cae44337876601a71a52c7797f436f0e62ebd6af75d')

package() {
  install -Dm755 "./swarm-cronjob" "${pkgdir}/usr/bin/swarm-cronjob"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
