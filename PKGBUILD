# lifehacker.com's todo.sh script for maintaining a todo.txt file

# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>

pkgname=todotxt-git
pkgver=2.10
pkgrel=2
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="https://github.com/todotxt/todo.txt-cli"
depends=('bash')
conflicts=('todotxt')
install=todotxt.install
source=("${pkgname}"::git+https://github.com/todotxt/todo.txt-cli)
md5sums=('SKIP')
arch=('any')
license=("GPL")

package() {
  cd $srcdir/$pkgname
  make
  make install CONFIG_DIR=$pkgdir/etc INSTALL_DIR=$pkgdir/usr/bin BASH_COMPLETION_DIR=$pkgdir/usr/share/bash-completion/completions
  make test
}
