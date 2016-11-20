# Maintainer: Jim Heald <james.r.heald@gmail.com>

pkgname=pyflowchart-git
pkgver=0.9
pkgrel=1
pkgdesc="Application to help manage cirriculum flowcharts at CalPoly"
arch=('any')
url="https://github.com/steelcowboy/PyFlowChart"
license=('BSD')
depends=('python-setuptools' 'gobject-introspection' 'python-gobject')
makedepends=('git' 'python-pip' 'cython')
source=("git+https://github.com/steelcowboy/PyFlowChart.git")
sha256sums=('SKIP')

build() {
  cd PyFlowChart  
  python setup.py build
}

package() {
  cd PyFlowChart  
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
