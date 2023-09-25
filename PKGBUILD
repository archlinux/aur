# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname="loaf"
pkgver=r24.cb9c4ed
pkgrel=2
pkgdesc="Simple terminal slack client written in Python"
arch=('any')
makedepends=('python-setuptools' 'git')
depends=('python-pyxdg' 'python-requests' 'python-aiohttp' 'python-urwid')
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
