# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-gui
pkgver=2.4
pkgrel=1
pkgdesc='Java GUI for Master Password'
arch=('any')
url='http://masterpasswordapp.com/'
license=('GPL3')
depends=('java-runtime')
source=("https://ssl.masterpasswordapp.com/$pkgname.jar"
        "${pkgname}.desktop" "${pkgname}.png" "${pkgname}.sh")
md5sums=('a98dfaad5183f141b9af49466f3c5236'
         'fe7c35c335000fff886e1aa97e44cd59'
         'a6f72aca863785f8021305fe417675d2'
         '6f0c67fd22697008c5f84561ecc42e1b')
noextract=("${pkgname}.jar")

package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 masterpassword-gui.jar "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  install -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
