# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=moley-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="Share a local app on your own domain with one command"
arch=('x86_64' 'aarch64')
url="https://github.com/stupside/moley"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/moley_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/moley_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('522b05dd82b601b009c5016e4d48c17813e201a363b8ef8b1f1d1bdb7222240d')
sha256sums_aarch64=('4edebb997abf173d88f0f0a93722445d2594502d5b0b3375a210994bea8fe54b')

package() {
  install -Dm755 "moley" "${pkgdir}/usr/bin/moley"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
