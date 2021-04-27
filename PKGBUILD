pkgname=py3-chirp-git
pkgver=r54.1e8bf92
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from a fork of CHIRP for testing with Python 3."
arch=('any')
url="https://github.com/mpoletiek/py3-CHIRP"
license=('GPL3')
depends=('python-wxpython' 'python-six' 'python-lxml' 'python-pyserial' 'python-future' 'python-gobject' 'curl')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=()
provides=('chirp')
conflicts=('chirp')
source=('git+https://github.com/mpoletiek/py3-CHIRP')
md5sums=('SKIP')

pkgver() {
  cd py3-CHIRP
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd py3-CHIRP
  sed -i 's|/usr/sbin|/usr/bin|' setup.py
}

package() {
  cd py3-CHIRP
  python3 setup.py install --root="$pkgdir" --optimize=0
}