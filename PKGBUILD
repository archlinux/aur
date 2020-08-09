# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
_pkgname=dromajo
pkgname=dromajo-git
pkgver=1.0.r25.gee470be
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/chipsalliance/dromajo/"
license=('MIT' 'Apache')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/chipsalliance/dromajo")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags|sed 's+-+.r+'|tr - .| cut -c2-
}


build() {
  cd $srcdir/$_pkgname/src/
  make
}

package() {
  install -D -m 755 $srcdir/$_pkgname/src/dromajo $pkgdir/usr/bin/dromajo
  install -D -m 755 $srcdir/$_pkgname/MIT-LICENSE.txt $pkgdir/usr/share/licenses/dromajo/License-MIT
  install -D -m 755 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/dromajo/LICENSE-Apache
}
