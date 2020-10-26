# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gdb-frontend-bin
pkgver=0.3.1.beta
_pkgver=0.3.1-beta
pkgrel=1
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://oguzhaneroglu.com/projects/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('e66c54c53e60c40de97ec655f2f0c775cd342d1a175cd26d10420a07634d33c1')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
  cp -aR ${pkgname%-bin}-${_pkgver} "${pkgdir}/opt/gdbfrontend"
  echo "#!/usr/bin/env bash
  cd /opt/gdbfrontend/
  ./gdbfrontend" > gdbfrontend.sh
  install -Dm755 gdbfrontend.sh "${pkgdir}/usr/bin/gdbfrontend"
}
