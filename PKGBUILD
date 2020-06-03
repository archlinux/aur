# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gdb-frontend-bin
pkgver=0.0.19.alpha
_pkgver=0.0.19-alpha
pkgrel=1
pkgdesc="An easy, flexible and extensionable gui debugger"
arch=('x86_64')
url='https://oguzhaneroglu.com/projects/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/releases/download/v${_pkgver}/gdb-frontend-${_pkgver}.tar.gz")
sha256sums=('9b126e9d684d8d29f8716af080c9654623e4e8d4e7104f4cb35cb0af50f808fc')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
  cp -aR ${pkgname%-bin}-${_pkgver} "${pkgdir}/opt/gdbfrontend"
  echo "#!/usr/bin/env bash
  cd /opt/gdbfrontend/
  ./gdbfrontend" > gdbfrontend.sh
  install -Dm755 gdbfrontend.sh "${pkgdir}/usr/bin/gdbfrontend"
}