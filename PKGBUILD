# Maintainer: Viachaslau Khalikin <vkhinegret@gmail.com>

pkgname=phoenix-emu-project
pkgver=2.7
pkgrel=1
pkgdesc="An emulator of 3DO consoles. 100% compatible!"
url="http://www.arts-union.ru/node/23"
license=('custom')
arch=('x86_64')
depends=('qt5-base' 'openal' 'glu')
source=("http://www.arts-union.ru/sites/default/files/ph27-lin-x64.zip"
        phoenix-emu-project.desktop
        phoenix-emu-project
        translation.xml.eng)
md5sums=('4ee74204154e36f0085b5720326e5c07'
         '7f9b5652c512887d7e034cc8c07b2045'
         '2dda6097a84eadaee848c31fe86001bd'
         'c90865e809e28d7fd203e00d1e581fd6')
prepare() {
  echo
}
package() {
  cd "$srcdir"
  # about licenses
  install -d "$pkgdir/usr/share/licenses/phoenix-emu-project"
  install -m644 licenses.txt "$pkgdir/usr/share/licenses/phoenix-emu-project"
  # startup script and executable
  install -d "$pkgdir/opt/phoenix-emu-project/"{,scalers,shaders,skin{,/rc}}  
  install -Dm755 PhoenixEmuProject "$pkgdir/opt/phoenix-emu-project/"
  install -Dm755 phoenix-emu-project "$pkgdir/usr/bin/phoenix-emu-project"
  install -Dm644 scalers/* "$pkgdir/opt/phoenix-emu-project/scalers/"
  install -Dm644 shaders/* "$pkgdir/opt/phoenix-emu-project/shaders/"
  install -Dm644 skin/style.* "$pkgdir/opt/phoenix-emu-project/skin/"
  install -Dm644 skin/rc/* "$pkgdir/opt/phoenix-emu-project/skin/rc"
  install -Dm644 translation.xml.eng "$pkgdir/opt/phoenix-emu-project/"
  # desktop icon
  install -Dm645 phoenix-emu-project.desktop "$pkgdir/usr/share/applications/phoenix-emu-project.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/phoenix-emu-project-logo.png"
}
