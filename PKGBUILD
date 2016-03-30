pkgbase='python-imagesize'
pkgname=('python-imagesize' 'python2-imagesize')
pkgver=0.7.0
pkgrel=1
pkgdesc='Getting image size from png/jpeg/jpeg2000/gif file'
arch=('any')
url='https://github.com/shibukawa/imagesize_py'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/i/imagesize/imagesize-${pkgver}.tar.gz")
md5sums=('23cb4b0b5ec76fb26942d6cc0b1cf31c')

build() {
  cp -r "${srcdir}"/imagesize-$pkgver "${srcdir}"/imagesize-$pkgver-py2

  cd "${srcdir}"/imagesize-$pkgver
  python setup.py build

  cd "${srcdir}"/imagesize-$pkgver-py2
  python2 setup.py build
} 

package_python-imagesize() {
  depends=('python')

  cd "${srcdir}"/imagesize-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-imagesize() {
  depends=('python2')
  cd "${srcdir}"/imagesize-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
