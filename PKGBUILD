# Maintainer: François Magimel <magimel.francois at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: rayte <rabyte__gmail>
# Contributor: aldeano <aldea.diaguita at gmail.com>

pkgname=(python-cerealizer python2-cerealizer)
pkgver=0.8.3
pkgrel=1
pkgdesc="A Python module for saving objects in a file"
arch=('any')
url="http://www.lesfleursdunormal.fr/static/informatique/cerealizer/index_en.html"
makedepends=("python-setuptools" "python2-setuptools")
license=('PSF')
source=(https://pypi.python.org/packages/source/C/Cerealizer/Cerealizer-${pkgver}.tar.gz)
md5sums=('a7cf54e5db5cb6485627d116ef90f89f')

prepare() {
    cp -a Cerealizer-$pkgver{,-py2}
}

build() {
    cd "$srcdir/Cerealizer-$pkgver"
    python setup.py build

    cd "$srcdir/Cerealizer-$pkgver-py2"
    python2 setup.py build
}

package_python-cerealizer() {
  depends=('python')
  cd "$srcdir/Cerealizer-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cerealizer() {
  depends=('python2')
  cd "$srcdir/Cerealizer-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
