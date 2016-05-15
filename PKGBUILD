# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=cryptomator
pkgver=1.0.5
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('MIT/X Consortium License')
depends=('java-runtime' 'java-environment' 'java-openjfx')
optdepends=('rng-tools: Entropy generation')
source=("https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/Cryptomator-${pkgver}.jar"
        "${pkgname}.sh")
noextract=("Cryptomator-${pkgver}.jar")
sha256sums=('6cbfdf09187f44dd1d4b837530416c6feaca5268644c9422ec75304458120e57'
            '0bc12ee603ef87536389aeb85bf0afaf8995bae2c9ed826290b2bb0d838a9766')


package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -D "${srcdir}/Cryptomator-${pkgver}.jar" "${pkgdir}/usr/share/java/$pkgname/cryptomator.jar"
  install -Dm655 "${srcdir}/cryptomator.sh" "${pkgdir}/usr/bin/cryptomator"
}
