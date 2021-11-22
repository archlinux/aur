# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
pkgver=0.9.5.beta
_pkgver=0.9.5-beta
pkgrel=1
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://oguzhaneroglu.com/projects/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('559f11ec7256238d5ecad013127d9750d1f87765e34c1d117925ecf958409b34')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
  cp -aR ${pkgname%-bin}-${_pkgver} "${pkgdir}/opt/gdbfrontend"
  echo "#!/usr/bin/env bash
  cd /opt/gdbfrontend/
  ./gdbfrontend" > gdbfrontend.sh
  install -Dm755 gdbfrontend.sh "${pkgdir}/usr/bin/gdbfrontend"
}
