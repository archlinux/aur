# Maintainer: Simon Boulay <simon.boulay@alkeona.net>

pkgbase=python-sphinxcontrib-tikz
pkgname=('python-sphinxcontrib-tikz' 'python2-sphinxcontrib-tikz')
pkgver=0.4.2
pkgrel=2
pkgdesc="TikZ extension for Sphinx."
arch=('any')
url="https://bitbucket.org/philexander/tikz"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/sphinxcontrib-tikz/sphinxcontrib-tikz-$pkgver.tar.gz")
sha1sums=('e7828e2f1dfbb190eb37374905356cfd29ff83d3')

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
