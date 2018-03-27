# lifehacker.com's todo.sh script for maintaining a todo.txt file
# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=todotxt
_pkgname=todo.txt_cli
pkgver=2.11.0
pkgrel=1
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
url="https://github.com/todotxt/todo.txt-cli"
depends=('bash')
install=$pkgname.install
source=(https://github.com/todotxt/todo.txt-cli/releases/download/v${pkgver}/$_pkgname-${pkgver}.tar.gz)
arch=('any')
license=('GPL')
md5sums=('8b81c7ccff967c1a1add8472dd63448b')

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m644 todo.cfg $pkgdir/usr/share/$pkgname/todo.cfg
  install -D -m755 todo.sh $pkgdir/usr/bin/todo.sh

  install -d $pkgdir/usr/share/bash-completion/completions/
  install -D -m644 todo_completion $pkgdir/usr/share/bash-completion/completions/todo.sh
}
