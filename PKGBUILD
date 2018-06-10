# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=1.9.0
pkgrel=1
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-scipy' 'python-deprecation' 'python-nibabel')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('3f42c42f361a8673aa4466818707559d03c99de6a27377c2b63f154884b62342')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching for deprecation 2.x support
  sed -i 's/deprecation>=1\.\*,<=2\.\*/deprecation>=1\.\*/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
