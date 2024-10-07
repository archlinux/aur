# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=mutmap
_name=MutMap
pkgver=2.3.6
pkgrel=1
pkgdesc='Pipeline to identify causative mutations responsible for a phenotype. https://doi.org/10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/MutMap"
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
         'python-seaborn'
         )
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=($_name-$pkgver::"https://github.com/YuSugihara/MutMap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74db0af6b2c3c83767d13509a9098ebb5fbb7170455770b056916ba48876ddb7')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
