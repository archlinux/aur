# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-kdedistutils-git
_gitname=python2-kdedistutils
pkgver=f25b4a0
pkgrel=2
pkgdesc="Distutils extensions for KDE applications"
arch=('any')
url="https://github.com/lunaryorn/kdedistutils"
license=('BSD')
depends=('python2')
conflicts=( "$_gitname" )
provides=( "$_gitname" )
makedepends=('git')
source=( "$_gitname::git+$url" 'setup.py' )
sha1sums=('SKIP'
          '6a6e25164d04afc91e4e4af55b53896db998b1dc')

_gitroot="$url"
_gitname="$_gitname"

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_gitname"
  ln -s ../setup.py
  python2 setup.py install --root="$pkgdir" --optimize=1
}
