# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=k8tz-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Inject timezones into Kubernetes Pods and CronJobs"
arch=('x86_64' 'aarch64')
url="https://github.com/k8tz/k8tz"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/k8tz_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/k8tz_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4941bb836d8f631af1c8eb26325b05796b1f380ff35f78886151b33c5e1a9dea')
sha256sums_aarch64=('74c529e57fd2231d034adc2e1b2bb8307f4ded924430db1e283cbb5af274d203')

package() {
  install -Dm755 "k8tz" "${pkgdir}/usr/bin/k8tz"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
