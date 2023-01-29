# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-bin
pkgver=7.23028.0
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
  '68e7930c31b4c495187b950cd72fd5d32eb4e51cd4147016786745e3f6f4875e'
  '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
