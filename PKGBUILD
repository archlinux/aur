# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-types
_pkgname=q2-types
pkgver=2020.11.0.dev0
pkgrel=1
pkgdesc="Definitions of common QIIME 2 types."
arch=('x86_64')
url="https://qiime2.org"
license=('BSD')
depends=('python' 'python-qiime2' 'python-biom-format' 'python-scikit-bio' 'python-h5py' 'python-pandas' 'python-ijson')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f597c68a6b6ef9dae36cfe1ae3dadbb5078ff7c845e4694847daf7e1562bae72')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
