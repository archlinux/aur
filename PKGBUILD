# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-bin
pkgver=7.24110.0
pkgrel=0
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
  'ce991a5599b01d141ee98d2020135bd6842e94e708df38a540f939aafe3d3468'
  '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
