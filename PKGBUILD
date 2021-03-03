# Maintainer: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>

pkgname=bcpkix
pkgver=1.68
pkgrel=1
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
  'fb8d0f8f673ad6e16c604732093d7aa31b26ff4e0bd9cae1d7f99984c06b8a0f'
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
