# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=unicli-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Control the Unity Editor from the terminal"
arch=('x86_64')
url="https://github.com/yucchiy/UniCli"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yucchiy/UniCli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/unicli-linux-x64.tar.gz")
sha256sums=('49d87ace012a451c510a331ef4fb5647a0cc870a178a1f616e5ecd709d10faab')
sha256sums_x86_64=('fb5db8fa3859ad6832a68d3b587a9f7d3c1def211fa0d257aaf566bff6a611ce')

package() {
  install -Dm755 "unicli" "${pkgdir}/usr/bin/unicli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
