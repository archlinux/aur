# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
pkgname=python2-sarge-git
pkgver=0.1.5.r33.gc5aff8b
pkgrel=1
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=(git)
depends=(python2)
provides=(python2-sarge)
conflicts=(python2-sarge)
source=('git+https://bitbucket.org/vinay.sajip/sarge')
md5sums=('SKIP')

pkgver() {
  cd sarge
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/sarge"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
