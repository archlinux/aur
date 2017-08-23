# lifehacker.com's todo.sh script for maintaining a todo.txt file
# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=todotxt
_pkgname=todo.txt_cli
pkgver=2.10
pkgrel=4
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="https://github.com/todotxt/todo.txt-cli"
depends=('bash')
install=$pkgname.install
source=(https://github.com/todotxt/todo.txt-cli/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('d90098b5f031d117faf129a4c90e812d')
arch=('any')
license=('GPL')

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m644 todo.cfg $pkgdir/usr/share/$pkgname/todo.cfg
  install -D -m755 todo.sh $pkgdir/usr/bin/todo.sh

  install -d $pkgdir/usr/share/bash-completion/completions/
  install -D -m644 todo_completion $pkgdir/usr/share/bash-completion/completions/todo.sh
}
