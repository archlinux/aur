# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=0.8
pkgrel=1
pkgdesc="A suite of visual analysis and diagnostic tools for machine learning"
arch=('any')
url='http://www.scikit-yb.org'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy' 'python-matplotlib'
         'python-scikit-learn' 'python-cycler')
_pypi='https://files.pythonhosted.org/packages'
_path='3f/c0/277a7720218200ae2720f94677ea898771a55298f41e5080d3e6923f4412'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")
sha256sums=('67cb9dde35fa36c8a4d700ad04b8f7478aece5e236c6785b4383d3cebe0b7e78')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
