# Maintainer: Travis Lyons <pkgbuild at trly dot dev>
pkgname=deja-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Predictive inline shell autosuggestions for zsh"
arch=('x86_64' 'aarch64')
url="https://github.com/Giammarco-Ferranti/deja"
license=('MIT')
depends=('glibc' 'zsh')
provides=("deja=${pkgver}")
conflicts=('deja')
options=('!debug' '!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/deja_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/deja_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f8ffcbefa37b3c1a8287d397518ba5586fcc069b0d1fa53da94736f2edc37642')
sha256sums_aarch64=('726b08adf7d6707f00f0f4e281422f4286a703b1f7be59251a84d131bfcd635a')

package() {
  install -Dm755 deja -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
