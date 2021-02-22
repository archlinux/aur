# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-gui
pkgver=2.7.11
pkgrel=1
pkgdesc='Java GUI for Master Password'
arch=('any')
url='http://masterpasswordapp.com/'
license=('GPL3')
depends=('java-runtime')
source=("https://ssl.masterpasswordapp.com/${pkgname}-${pkgver}.jar"
        "${pkgname}.desktop" "${pkgname}.png" "${pkgname}.sh")
sha1sums=('cc79337ebc87663580a94b662547a0096c12cf80'
          '663d645fe83358b8a5061de7260b3eed9c79bac3'
          'cc3bb9d05c24db935f1bdd56a0c82ada42c724d1'
          'cea8783054a993d5f18d71edb3ec991453f9c46c')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  install -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
