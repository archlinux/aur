# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

pkgname=bcpkix
pkgver=1.56
pkgrel=2
pkgdesc='Java cryptography APIs (Bouncy Castle) package for PKIX/CMS/EAC/DVCS/PKCS/TSP/OPENSSL'
arch=('any')
url='https://www.bouncycastle.org/java.html'
license=('custom')
depends=('bcprov')
source=(
  "https://www.bouncycastle.org/download/bcpkix-jdk15on-${pkgver/./}.jar"
  LICENSE.html
)
sha256sums=(
  '7043dee4e9e7175e93e0b36f45b1ec1ecb893c5f755667e8b916eb8dd201c6ca'
  'e9bb81d9c9486a5de0d1facd674e761b46cc421ddd31bbd2b100871a8bea2ed6'
)
noextract=(bcpkix-jdk15on-${pkgver/./}.jar)

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/java"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 bcpkix-jdk15on-${pkgver/./}.jar "${pkgdir}/usr/share/java/bcpkix.jar"
  install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
