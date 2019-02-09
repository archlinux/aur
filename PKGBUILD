# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-types
_pkgname=q2-types
pkgver=2019.1.0
pkgrel=1
pkgdesc="Definitions of common QIIME 2 types."
arch=('any')
url="https://qiime2.org"
license=('BSD 3-Clause License')
depends=('python' 'python-qiime2' 'python-biom-format' 'python-scikit-bio' 'python-h5py' 'python-pandas' 'python-ijson')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('facb098fb05f9833417de2dccf108675619d480c0efdac6545a384c6473ff460')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
