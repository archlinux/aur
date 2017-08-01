# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=md-to-rst
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool to convert markdown to restructed text (md to rst)"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/mdToRst"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/mdToRst/archive/${pkgver}.tar.gz")
sha512sums=("c58fda65f7af3db875d6ca5b330e14b5fc74a02d1e97593a77438479efb3c5995e9900f3ce25b30a4fc98db99875a7c9233eff0810e0520666bb74cbf0318cbf")

build() {
  cd "$srcdir"/mdToRst-$pkgver
  python setup.py build
}

package() {
  cd mdToRst-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
