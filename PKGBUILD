# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-txdbus-git
_pythoname=txdbus
pkgver=0
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python2' 'twisted' )
source=("${_pythoname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pythoname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/${_pythoname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
