# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=qrypad-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="SQL scratchpad for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/wheelibin/qrypad"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/qrypad_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/qrypad_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c39ed452a4974b6895e8b86972f6d04c7856d0c1941bf6c970e081bb014dea65')
sha256sums_aarch64=('2412e2496e850e61d614b937a786fe6e1eba58b36244cdce390a3a0b939cd031')

package() {
  install -Dm755 "qrypad" "${pkgdir}/usr/bin/qrypad"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
