# Maintainer: Xyem <xyem@electricjungle.org>
pkgname=sheepit-client-bin
pkgver=6.22214.0
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
  'e9ebee8ea94eae078be4e8523425213212507e26296f49d273a799fafd441b4d'
  '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/${pkgname%-bin}.jar"
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
