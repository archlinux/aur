# Maintainer: Viachaslau Khalikin <vkhinegret@gmail.com>

pkgname=phoenix-emu-project
pkgver=2.5
pkgrel=1
pkgdesc="An emulator of 3DO consoles. 100% compatible!"
url="http://www.arts-union.ru/node/23"
license=('custom')
arch=('x86_64')
depends=('qt5-base' 'openal' 'glu')
install="phoenix-emu-project.install"
source=("http://www.arts-union.ru/sites/default/files/ph25-lin-x64.zip"
        phoenix-emu-project.desktop
        phoenix-emu-project)
md5sums=('a311f2143af0f70cc91b701865134d02'
         '7f9b5652c512887d7e034cc8c07b2045'
         '9f5ad5e6700d4082a24c53c033184207')
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
  # desktop icon
  install -Dm645 phoenix-emu-project.desktop "$pkgdir/usr/share/applications/phoenix-emu-project.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/phoenix-emu-project-logo.png"
}
