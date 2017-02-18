# Maintainer: Jim Heald <james.r.heald@gmail.com>

pkgname=pyflowchart-git
pkgver=0.9.2
pkgrel=2
pkgdesc="Application to help manage curriculum flowcharts at CalPoly"
arch=('any')
url="https://github.com/steelcowboy/PyFlowChart"
license=('BSD')
depends=('python-setuptools' 'gobject-introspection' 'python-gobject' 'gtk3')
makedepends=('git' 'cython')
source=("git+https://github.com/steelcowboy/PyFlowChart.git" "pyflowchart.desktop")
sha256sums=('SKIP' '5f1cfdfd272605ac2db8a644ad07dd6a49eea91a90529b4b7994de45883c0b65')

build() {
  cd $srcdir/PyFlowChart  
  python setup.py build
}

package() {
  cd $srcdir/PyFlowChart  
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 "$srcdir/pyflowchart.desktop" "$pkgdir/usr/share/applications/pyflowchart.desktop"
}

# vim:set ts=2 sw=2 et:
