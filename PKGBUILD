# Maintainer: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>

pkgname=bcpkix
pkgver=1.77
pkgrel=1
pkgdesc='Java cryptography APIs (Bouncy Castle) package for PKIX/CMS/EAC/DVCS/PKCS/TSP/OPENSSL'
arch=('any')
url='https://www.bouncycastle.org/java.html'
license=('custom')
depends=('bcprov')
source=(
  "https://www.bouncycastle.org/download/bcpkix-jdk18on-${pkgver/./}.jar"
  LICENSE.html
)
sha256sums=(
  '1ac7fe8efd5b2f38cdc165be5a0675734fe44808dab92707201f03a535d6f1b8'
  'e9bb81d9c9486a5de0d1facd674e761b46cc421ddd31bbd2b100871a8bea2ed6'
)
noextract=(bcpkix-jdk18on-${pkgver/./}.jar)

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/java"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 bcpkix-jdk18on-${pkgver/./}.jar "${pkgdir}/usr/share/java/bcpkix.jar"
  install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
