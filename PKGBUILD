# Maintainer: TuxnVape Elrondo46 <elrond94athotmail.com

pkgname=pybombs-git
pkgver=r949.cb0f5b9
pkgrel=1
pkgdesc="PyBOMBS is the new GNU Radio install management system"
arch=('any')
url="https://github.com/jotaro0010/pyanisort"
license=('GPL3')
makedepends=('git')
depends=('python' 'python-ruamel-yaml' 'python-pip' 'python-requests' 'python-future' 'python-six' 'python-setuptools')
source=('git+https://github.com/gnuradio/pybombs.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pybombs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/pybombs"
   python setup.py install --root="$pkgdir/" --optimize=1
#   mkdir -p $pkgdir/usr/share/licenses/$pkgname
#   install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
