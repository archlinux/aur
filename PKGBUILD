# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=python-ly-git
pkgver=0.9.5.r1.g1cd3260
pkgrel=2
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/wbsoft/python-ly"
license=('GPL')
makedepends=('git')
depends=('python')
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("$pkgname"::'git://github.com/wbsoft/python-ly.git')
md5sums=('SKIP')

_gitroot='https://github.com/wbsoft/python-ly.git'
_gitname='python-ly'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
