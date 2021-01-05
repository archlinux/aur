# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=3.4.0
pkgrel=1
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
# Keep python-deprecated to keep FEAT check of FSL FEEDS from failing
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py' 'python-deprecation' 'python-dataclasses')
makedepends=('python-setuptools')
optdepends=('python-rtree' 'python-pillow')
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('eeb10410f800490a4d27f80ea63dd4415b9651016a52744d287da25b4f5f570a')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}
