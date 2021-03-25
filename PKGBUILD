pkgname=gossm-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Interactive CLI tool that you can connect to ec2 using commands same as start-session, ssh in AWS SSM Session Manager "
arch=('x86_64')
url="https://github.com/gjbae1212/${pkgname%-bin}"
license=('MIT')
depends=(
  'pacman>5'
  'openssh'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gjbae1212/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('97e18c4faa6c8da48d390aaa81acfe7080aab10875887b4ca1898470664c8c4b')

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${pkgname}"
  install "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install "${srcdir}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install "${srcdir}/README.md" "${pkgdir}/usr/share/${pkgname}/README.md"
}
