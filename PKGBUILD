# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=1.4.2
pkgrel=1
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-nibabel' 'wxpython-phoenix' 'python-indexed-gzip')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('b12ac2253d4411fff6215a2a994cdad207628f61bcb249c57e92462b0d6d5ce4')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching" for scipy 1.0 support
  sed -i 's/scipy>=0\.18,<1/scipy/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
