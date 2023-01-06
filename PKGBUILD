# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-bin
pkgver=6.22303.0
pkgrel=1
pkgdesc='Client for the SheepIt render farm'
arch=('x86_64')
url='https://www.sheepit-renderfarm.com'
license=('GPL2')
depends=('java-runtime>=11')
conflicts=('sheepit-client-git')
source=(
  "https://www.sheepit-renderfarm.com/media/applet/${pkgname%-bin}-${pkgver}.jar"
  'sheepit-client.sh'
)
sha256sums=(
  '114fd2bb1b4c77d1407fe3924afb9edc17eca2f4acc573b59644692dfa998833'
  '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
