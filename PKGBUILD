# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=0.9
pkgrel=1
pkgdesc="A suite of visual analysis and diagnostic tools for machine learning"
arch=('any')
url='http://www.scikit-yb.org'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy' 'python-matplotlib'
         'python-scikit-learn' 'python-cycler')
_pypi='https://files.pythonhosted.org/packages'
_path='15/ab/d9d40b35792c19863780abb8e8cfef03f75c643705bd1d4512203f6e01d3'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")
sha256sums=('e4ca98068da958dba27900a315868557c9f6aa759453b25aebbc7e5fda7a61fb')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
