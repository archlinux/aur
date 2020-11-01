# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-dada2
pkgver=2020.11.0.dev0
pkgrel=1
pkgdesc="QIIME 2 plugin wrapping DADA2"
arch=('x86_64')
url="https://qiime2.org"
license=('BSD')
depends=('python-qiime2' 'python-q2-types' 'python-biom-format' 'r-dada2')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/q2-dada2/archive/${pkgver}.tar.gz")
sha256sums=('81633daef1e92328087ff6a6a7b5092cd900ab2c004f8de438bd97ed232315c1')

build() {
  cd "q2-dada2-$pkgver"
  python setup.py build
}

package(){
  cd "q2-dada2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
