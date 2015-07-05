pkgname=python-stem-git
pkgver=1.1.1.r22.ga6d025d
pkgrel=1
epoch=1
pkgdesc='A controller library for Tor'
arch=('any')
url='https://stem.torproject.org/'
license=('LGPL3')
depends=('python')
makedepends=('git')
source=('git://git.torproject.org/stem.git')
sha256sums=('SKIP')

_gitname='stem'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
