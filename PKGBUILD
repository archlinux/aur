# Contibutor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
# Maintainer: Whyme Lyu <callme5long@gmail.com>

_pkgname=bbcp
pkgname=bbcp-git
pkgver=15.02.03.00.2
pkgrel=1
pkgdesc="A high-performance network file copy application."
arch=('x86_64')
url="http://www.slac.stanford.edu/~abh/bbcp/"
license=('LGPL3')
depends=('openssl' 'zlib' 'openssh')
makedepends=('sed' 'git')
source=('git+http://www.slac.stanford.edu/%7Eabh/bbcp/bbcp.git/')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname/src"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  osver=`./MakeSname`
  install -Dm 755 "$srcdir/$_pkgname/bin/$osver/bbcp" "$pkgdir/usr/bin/bbcp"
}
