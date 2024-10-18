# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=qtl-seq
_name=QTL-seq
pkgver=2.2.8
pkgrel=1
pkgdesc='Pipeline for bulk segregant analysis. https://doi.org/10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/QTL-seq"
license=('GPL')
depends=(
         'bwa'
         'samtools'
         'snpeff'
         'bcftools'
         'trimmomatic'
         'python-matplotlib'
         'python-numpy'
         'python-pandas'
         'python-seaborn')
optdepends=('mutmap: identify causative mutations responsible for phenotype')
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=($_name-$pkgver::"https://github.com/YuSugihara/QTL-seq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe4fd97a50a2240d60987f4c7dc67db2dee23654a5ec34bd08e30108a0ed1bdc')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
