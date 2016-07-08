pkgbase=python-bottlechest
pkgname=('python-bottlechest' 'python2-bottlechest')
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast NumPy array functions written in Cython"
url="https://github.com/biolab/bottlechest"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy')
source=("https://github.com/biolab/bottlechest/archive/${pkgver}.tar.gz")
md5sums=('4e2f678b8af8decd157f74a76fb2a76b')

build() {
  cp -r "${srcdir}"/bottlechest-$pkgver "${srcdir}"/bottlechest-$pkgver-py2

  cd "${srcdir}"/bottlechest-$pkgver
  python setup.py build

  cd "${srcdir}"/bottlechest-$pkgver-py2
  python2 setup.py build
} 

package_python-bottlechest() {
  depends=('python-numpy')

  cd "${srcdir}"/bottlechest-$pkgver
  python setup.py install --root="${pkgdir}"
}

package_python2-bottlechest() {
  depends=('python2-numpy')

  cd "${srcdir}"/bottlechest-$pkgver-py2
  python2 setup.py install --root="${pkgdir}"
}
