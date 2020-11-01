# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-rgt
pkgver=0.13.1
pkgrel=1
pkgdesc="Regulatory Genomics Toolbox"
arch=(x86_64)
url=http://www.regulatory-genomics.org
license=(GPL3)
depends=(python python-numpy python-scipy python-pysam python-pybigwig python-pyvcf python-natsort python-matplotlib python-scikit-learn python-matplotlib-venn python-mpmath python-htseq python-hmmlearn python-pyx python-moods python-fisher python-biopython)
makedepends=(python-setuptools)
source=("https://github.com/CostaLab/reg-gen/archive/v${pkgver}.tar.gz")
sha256sums=('0c005325e3adac0746e36618747e24c9b2a2bdcb67c42305b680bfcfe562ae0f')

prepare() {
  cd "reg-gen-$pkgver"
  #sed -i 's,pyBigWig==,pyBigWig>=,g' setup.py
}

build() {
  cd "reg-gen-$pkgver"
  python setup.py build
}


package(){
  cd "reg-gen-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
