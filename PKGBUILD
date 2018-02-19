# Maintainer: Zeaq <m dot pichlo at gmx dot de>
pkgname=pactory-git
_gitname=pactory
pkgver=20180219
pkgrel=1
pkgdesc="Pacman History - Logfile parser for pacman.log"
url="http://github.com/zeaq/pactory"
license=("GPL3")
arch=('any')
makedepends=('git')
depends=('bash' 'pacman' 'sed')
source=('git+https://github.com/zeaq/pactory.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  install -Dm755 "$srcdir/${_gitname}/pactory" "$pkgdir/usr/bin/pactory"
}

