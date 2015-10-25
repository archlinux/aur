# lifehacker.com's todo.sh script for maintaining a todo.txt file

# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=todotxt-git
pkgver=2.10
pkgrel=2
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="http://ginatrapani.github.com/todo.txt-cli/"
depends=('bash')
source=("${pkgname}"::git+https://github.com/albfan/todo.txt-cli)
md5sums=('SKIP')
arch=('any')
license="GPL"

package() {
  cd $srcdir/$pkgname
  make
  make install CONFIG_DIR=$pkgdir/etc INSTALL_DIR=$pkgdir/usr/bin
  make test
}
