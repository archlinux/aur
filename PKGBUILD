# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=humanlog-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="Local log observability and pretty-printing"
arch=('x86_64' 'aarch64')
url="https://github.com/humanlogio/humanlog"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/humanlog_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/humanlog_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('59330f74ada7062fd094d96e46c5adb254e56ef3a03e09844ef79b653defcdf6')
sha256sums_aarch64=('b1eccd78573873d4bca45a7b3c71ff4a016790dde39ceedc92e5f26215038780')

package() {
  install -Dm755 "humanlog" "${pkgdir}/usr/bin/humanlog"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
