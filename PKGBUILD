pkgname=gossm-bin
pkgver=1.4.0
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
sha256sums=('3d683e9293aac2341476fbfe3551e97e84022e9ecc16b8f685c41b797e1c1ec4')

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${pkgname}"
  install "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install "${srcdir}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install "${srcdir}/README.md" "${pkgdir}/usr/share/${pkgname}/README.md"
}
