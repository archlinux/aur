# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname="loaf"
pkgver=r22.ff9519d
pkgrel=1
pkgdesc="Simple terminal slack client written in Python"
arch=('any')
makedepends=('python-setuptools')
depends=('python-pyxdg' 'python-requests' 'python-pyramid' 'python-aiohttp' 'python-urwid')
license=('LGPL')
url="https://github.com/NickBeeuwsaert/loaf"
source=(git+https://github.com/cbehan/loaf.git)

pkgver() {
  cd "$srcdir"/loaf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/loaf
  python setup.py install --root="$pkgdir" --prefix=/usr
}

sha256sums=('SKIP')
