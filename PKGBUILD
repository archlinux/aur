# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-bin
pkgver=6.22092.0
pkgrel=1
pkgdesc='Client for the SheepIt render farm'
arch=('x86_64')
url='https://www.sheepit-renderfarm.com'
license=('GPL2')
depends=('java-runtime')
conflicts=('sheepit-client-git')
backup=('etc/conf.d/sheepit-client')
source=(
  "https://www.sheepit-renderfarm.com/media/applet/${pkgname%-bin}-${pkgver}.jar"
  'sheepit-client.sh'
)
sha256sums=(
  'ee89593fef1d39066020ba8fc4c9ba24d86bd321c6b0cdfd5b0abd90cc9135ff'
  '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
