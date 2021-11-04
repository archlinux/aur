# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
pkgver=0.8.2.beta
_pkgver=0.8.2-beta
pkgrel=1
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://oguzhaneroglu.com/projects/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('8f1546c0d467576eca891556e5ff93a9ad6c6e319277eb49f163049f434bd746')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
  cp -aR ${pkgname%-bin}-${_pkgver} "${pkgdir}/opt/gdbfrontend"
  echo "#!/usr/bin/env bash
  cd /opt/gdbfrontend/
  ./gdbfrontend" > gdbfrontend.sh
  install -Dm755 gdbfrontend.sh "${pkgdir}/usr/bin/gdbfrontend"
}
