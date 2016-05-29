# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=genesis-starter
pkgver=2.0
pkgrel=1
arch=('any')
pkgdesc="Character creation tool for Splittermond"
url="http://blog.rpgframework.de/?p=434"
license=('unknown')
depends=('java-environment' 'desktop-file-utils')
source=("starter.jar::http://www.rpgframework.de/bootloader1/genesis-$pkgver-starter.jar"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('41f30671ba15bf42ffe4befe497582aaa0d78d040b8be0035fbe5d3248ebe82a'
            '9b0d1311778b30dfb013f2ce576b63197382d1ff652580c93953f47b8f2900bc'
            '30c582b5d315c01c78428eed5f2f43fd2667f1c23f9005964301de84dcbfa14e')

package() {
  cd $srcdir
  # start script
  install -m755 -D "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # jar file
  install -m644 -D "./starter.jar" "${pkgdir}/usr/share/java/${pkgname}/starter.jar"
  # menu entry
  install -m644 -D "./${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
