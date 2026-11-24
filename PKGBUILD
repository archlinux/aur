# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=b9s-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Keyboard-driven terminal UI for Beads issues, modelled on k9s"
arch=('x86_64' 'aarch64')
url="https://github.com/vanderheijden86/b9s"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/b9s_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/b9s_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c0f6d1cfe05009af9319f7505a3fc3460f53cd5ba6e936d9b1d9a0ed381f0ca7')
sha256sums_aarch64=('98e34af619f7e62caa1e0c405b601b7f799a1932309eb516ae2e7176be38d4a4')

package() {
  install -Dm755 "b9s" "${pkgdir}/usr/bin/b9s"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
