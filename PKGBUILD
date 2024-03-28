pkgname=m64py-git
_gitname=mupen64plus-ui-python
pkgver=0.2.5.r37.90093ce
pkgrel=1
pkgdesc='A frontend for Mupen64Plus'
arch=('any')
url='http://m64py.sourceforge.net/'
license=('GPL')
depends=(mupen64plus python-pyqt5 python-pysdl2)
makedepends=(git python-setuptools qt5-tools)
conflicts=(m64py)
provides=(m64py)
source=("git+https://github.com/mupen64plus/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
}
