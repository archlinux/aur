# Maintainer: robertfoster

pkgname=python-rlp
pkgver=4.0.1
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.org/project/rlp/'
license=('MIT')
arch=('any')
depends=('python' 'python-eth-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname##python-}-${pkgver}"
  python3 -m build -nwx
}

package() {
  cd "${srcdir}/${pkgname##python-}-${pkgver}"
  python3 -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('bcefb11013dfadf8902642337923bd0c786dc8a27cb4c21da6e154e52869ecb1')
