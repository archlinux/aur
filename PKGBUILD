# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=plotly.py
pkgname=python-plotly
pkgver=r1780.d88c5d0
pkgrel=1
pkgdesc="An interactive, browser-based charting library for python"
arch=('i686' 'x86_64')
url="https://plot.ly/python/"
license=('MIT')
depends=('python-requests' 'python-pytz')
makedepends=('git' 'python' 'python-setuptools')
source=("git+https://github.com/plotly/plotly.py.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  #[ -d build ] && rm -rf build
  #mkdir build
  #cd build

  #python config.py -auto
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}" --prefix=/usr
}
