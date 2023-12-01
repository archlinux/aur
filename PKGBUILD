# Maintainer: robertfoster

pkgname=python-rlp
pkgver=4.0.0
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

sha256sums=('61a5541f86e4684ab145cb849a5929d2ced8222930a570b3941cf4af16b72a78')
