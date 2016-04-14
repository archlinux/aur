# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=cryptomator
pkgver=1.0.3
pkgrel=4
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('MIT/X Consortium License')
depends=('java-runtime' 'java-environment' 'java-openjfx')
optdepends=('rng-tools: Entropy generation')
source=("https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/Cryptomator-${pkgver}.jar"
        "${pkgname}.sh")
noextract=("Cryptomator-${pkgver}.jar")
sha256sums=('6b4a8736b56b1c83f4bda67e28967c6c5df870b9fb1e1bbd96077f7a5efa9a60'
            '0bc12ee603ef87536389aeb85bf0afaf8995bae2c9ed826290b2bb0d838a9766')


package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -D "${srcdir}/Cryptomator-${pkgver}.jar" "${pkgdir}/usr/share/java/$pkgname/cryptomator.jar"
  install -Dm655 "${srcdir}/cryptomator.sh" "${pkgdir}/usr/bin/cryptomator"
}
