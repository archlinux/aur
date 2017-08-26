pkgbase=python-bkcharts
pkgname=('python-bkcharts' 'python2-bkcharts')
pkgver=0.2
pkgrel=1
pkgdesc="High level chart types built on top of Bokeh"
arch=(any)
url="http://github.com/bokeh/bkcharts"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python-six' 'python2-numpy' 'python2-six')
source=("https://pypi.io/packages/source/b/bkcharts/bkcharts-$pkgver.tar.gz")
sha256sums=('a5eaa8e78853dcecaa46345812e4fabe9cd3b96330ebf0809f640a4a0556d72e')

build() {
  cp -r "${srcdir}"/bkcharts-$pkgver "${srcdir}"/bkcharts-$pkgver-py2

  cd "${srcdir}"/bkcharts-$pkgver
  python setup.py build

  cd "${srcdir}"/bkcharts-$pkgver-py2
  python2 setup.py build
}

package_python-bkcharts() {
  depends=('python-numpy' 'python-six')

  cd "${srcdir}/bkcharts-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-bkcharts() {
  depends=('python2-numpy' 'python2-six')

  cd "${srcdir}/bkcharts-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}


