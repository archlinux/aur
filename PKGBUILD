# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
pkgver=0.6.2.beta.2
_pkgver=0.6.2-beta.2
pkgrel=1
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://oguzhaneroglu.com/projects/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('1ef5208cf187cd71a6438dc4afb3400e048863d4b65ffe46a09bb780d0b5bf7a')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
  cp -aR ${pkgname%-bin}-${_pkgver} "${pkgdir}/opt/gdbfrontend"
  echo "#!/usr/bin/env bash
  cd /opt/gdbfrontend/
  ./gdbfrontend" > gdbfrontend.sh
  install -Dm755 gdbfrontend.sh "${pkgdir}/usr/bin/gdbfrontend"
}
