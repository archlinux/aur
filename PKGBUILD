# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=qtl-seq
_name=QTL-seq
pkgver=2.2.9
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
sha256sums=('aca1cecb48f0b9bcec4f77bb7a6ab07f7f687a924a58d7a7f81c460aa3abcd9e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
