# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>
pkgname=python2-pylru-git
pkgver=r62.eca0254
pkgrel=1
pkgdesc="A least recently used (LRU) cache for Python."
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL')
depends=(python2)
provides=(python2-pylru)
conflicts=(python2-pylru)
source=('git+https://github.com/jlhutch/pylru.git')
md5sums=('SKIP')

pkgver() {
  cd pylru
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/pylru"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
