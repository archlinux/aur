# Maintainer: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>

pkgname=bcpkix
pkgver=1.86
pkgrel=1
pkgdesc='Java cryptography APIs (Bouncy Castle) package for PKIX/CMS/EAC/DVCS/PKCS/TSP/OPENSSL'
arch=('any')
url='https://www.bouncycastle.org/java.html'
license=('custom')
depends=('bcprov')
source=(
  "https://repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk18on/${pkgver}/bcpkix-jdk18on-${pkgver}.jar"
  LICENSE.html
)
sha256sums=(
  '8d8b41a4b149bdae8d331f059a578870954d1e3ff29f8269a9eb3ee19a7e4ef7'
  'e9bb81d9c9486a5de0d1facd674e761b46cc421ddd31bbd2b100871a8bea2ed6'
)
noextract=(bcpkix-jdk18on-${pkgver}.jar)

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/java"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 bcpkix-jdk18on-${pkgver}.jar "${pkgdir}/usr/share/java/bcpkix.jar"
  install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
