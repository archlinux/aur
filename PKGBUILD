# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=mutmap
_name=MutMap
pkgver=2.3.9
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
sha256sums=('3ac191b3f0d6348072547fcb619ab9feffa222c6270f6cc526b0ac511217d733')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
