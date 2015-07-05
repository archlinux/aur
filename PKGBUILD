pkgname=python2-stem-git
pkgver=1.4.1.r34.g63c08cc
pkgrel=1
epoch=1
pkgdesc='A controller library for Tor'
arch=('any')
url='https://stem.torproject.org/'
license=('LGPL3')
depends=('python2')
makedepends=('git')
source=('git+https://git.torproject.org/stem.git')
sha256sums=('SKIP')

_gitname='stem'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
