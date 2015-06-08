# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
pkgname=python2-sarge-git
pkgver=r133.b624f40f62a9
pkgrel=1
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('mercurial')
depends=(python2)
provides=(python2-sarge)
conflicts=(python2-sarge)
source=('hg+https://bitbucket.org/vinay.sajip/sarge')
md5sums=('SKIP')

pkgver() {
  cd sarge
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/sarge"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
