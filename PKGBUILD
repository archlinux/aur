# Maintainer: robertfoster

pkgname=python-rlp
pkgver=3.0.0
pkgrel=2
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

sha256sums=('63b0465d2948cd9f01de449d7adfb92d207c1aef3982f20310f8009be4a507e8')
