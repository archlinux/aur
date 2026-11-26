# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=killgrave-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Simple mock server generator"
arch=('x86_64' 'aarch64')
url="https://github.com/friendsofgo/killgrave"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/killgrave_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/killgrave_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('583adc9bc795e70a16cd6931945a275dab2ca3f8d3becc161046202835059e2f')
sha256sums_aarch64=('dabeec6bf6a71b266ce41abc923723bfba48e142c61ce296851984b66d5a6c05')

package() {
  install -Dm755 "killgrave" "${pkgdir}/usr/bin/killgrave"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
