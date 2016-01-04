# Maintainer: Simon Boulay <simon.boulay@alkeona.net>

pkgbase=python-sphinxcontrib-tikz
pkgname=('python-sphinxcontrib-tikz' 'python2-sphinxcontrib-tikz')
pkgver=0.4.1
pkgrel=1
pkgdesc="TikZ extension for Sphinx."
arch=('any')
url="https://pypi.python.org/pypi/sphinxcontrib-tikz"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/sphinxcontrib-tikz/sphinxcontrib-tikz-0.4.1.tar.gz")
md5sums=('125c5e2a0adb8c70591873343098b271')

prepare() {
  cp -a "sphinxcontrib-tikz-$pkgver" "sphinxcontrib-tikz2-$pkgver"
}

package_python-sphinxcontrib-tikz() {
  depends=('python' 'python-setuptools')

  cd "sphinxcontrib-tikz-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-tikz() {
  depends=('python2' 'python2-setuptools')

  cd "sphinxcontrib-tikz2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
