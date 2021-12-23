# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=3.8.0
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
source=(https://git.fmrib.ox.ac.uk/fsl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b0b519eb2132f1d78bf0e9fb7ca3f1eb3f77fc1a9e5faa78cdb0aedc5c3ea486')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
