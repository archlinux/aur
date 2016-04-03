# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=cryptomator
pkgver=1.0.3
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('MIT/X Consortium License')
depends=('java-runtime' 'java-environment' 'java-openjfx')
source=("https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/Cryptomator-${pkgver}.jar")
noextract=("Cryptomator-${pkgver}.jar")
sha256sums=('6b4a8736b56b1c83f4bda67e28967c6c5df870b9fb1e1bbd96077f7a5efa9a60')


package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -r * "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
