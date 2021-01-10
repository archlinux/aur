# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-dada2
pkgver=2021.2.0.dev0
pkgrel=1
pkgdesc="QIIME 2 plugin wrapping DADA2"
arch=('x86_64')
url="https://qiime2.org"
license=('BSD')
depends=('python-qiime2' 'python-q2-types' 'python-biom-format' 'r-dada2')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qiime2/q2-dada2/archive/${pkgver}.tar.gz")
sha256sums=('b2d9e51338e8f89b37c4fd668b0f0fc52fb579cb7dee5ad59dc7c753dbd6f416')

build() {
  cd "q2-dada2-$pkgver"
  python setup.py build
}

build() {
  cd "q2-dada2-$pkgver"
  python setup.py test
}

package(){
  cd "q2-dada2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
