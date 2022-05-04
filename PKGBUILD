pkgname=gossm-bin
pkgver=1.4.6
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
sha256sums=('3889a711b4dd50cee53e54ec4872cb5e0fe63da68cb6f7334dd3b720782e45c4')

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${pkgname}"
  install "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install "${srcdir}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install "${srcdir}/README.md" "${pkgdir}/usr/share/${pkgname}/README.md"
}
