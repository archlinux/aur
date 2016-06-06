pkgname=m64py-git
_gitname=mupen64plus-ui-python
pkgver=0.2.3.r11.80555df
pkgrel=1
pkgdesc='A frontend for Mupen64Plus'
arch=('any')
url='http://m64py.sourceforge.net/'
license=('GPL')
depends=(mupen64plus python-pyqt5 sdl2)
makedepends=(git python-setuptools)
conflicts=(m64py)
provides=(m64py)
source=("git://github.com/mupen64plus/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
}
