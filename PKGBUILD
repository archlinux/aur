# Maintainer: TingPing tingping@tingping.se

pkgname=pygobject-docs-git
pkgver=r1.gaded0d4
pkgrel=1
pkgdesc='Devhelp documentation for PyGObject libraries'
arch=('any')
url='https://github.com/lazka/pgi-docs-devhelp'
license=('LGPL2')
options=('!strip')
depends=('devhelp')
source=('git+https://github.com/lazka/pgi-docs-devhelp.git')
md5sums=('SKIP')
_gitname='pgi-docs-devhelp'

pkgver() {
  cd "$_gitname"

  _rev=`git rev-list --count HEAD`
  _hash=`git describe --always`
  echo "r$_rev.g$_hash"
}

package() {
  cd "$_gitname"

  _dest="$pkgdir/usr/share/devhelp/books"

  mkdir -p "$_dest"
  cp --no-preserve=all -r python-* "$_dest"
}
