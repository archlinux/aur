_pkgname=pocketsphinx
pkbase=python-pocketsphinx
pkgname=('python-pocketsphinx' 'python2-pocketsphinx')
pkgver=0.1.3
pkgrel=1
pkgdesc="Python interface to CMU Sphinxbase and Pocketsphinx libraries"
arch=('i686' 'x86_64')
url="https://github.com/bambocher/pocketsphinx-python"
license=('BSD')
makedepends=('swig' 'python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/pocketsphinx/pocketsphinx-${pkgver}.zip")
md5sums=('9178ad9baf886d54c23f25ee940dbd28')

prepare () {
  cp -r "$srcdir"/$_pkgname-$pkgver "$srcdir"/$_pkgname-$pkgver-py2
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build

  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py build
}

package_python-pocketsphinx() {
  depends=('python')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-pocketsphinx() {
  depends=('python2')
  cd $srcdir/$_pkgname-$pkgver-py2
  python2 setup.py install --root=$pkgdir --optimize=1
}
