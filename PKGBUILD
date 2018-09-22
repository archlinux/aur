# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=md-to-rst
pkgver=1.1.0
pkgrel=3
pkgdesc="Tool to convert markdown to restructed text (md to rst)"
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/mdToRst"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/mdToRst/archive/${pkgver}.tar.gz")
sha512sums=("700279976533cf38b4aa775b2537564e60ee0a556109d5deb6a22dc1c86f61b76544497287afc919fd63f42913230d915f282d9badce61e2667cf2e4b1a38849")

build() {
  cd "$srcdir"/mdToRst-$pkgver
  python setup.py build
}

package() {
  cd mdToRst-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
