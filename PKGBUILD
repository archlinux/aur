# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.14.8
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer, widgets is one of its dependent projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-wxpython' 'python-deprecation')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/fsleyes/${pkgname#fsleyes-}/-/archive/${pkgver}/${pkgname#fsleyes-}-${pkgver}.tar.gz")
sha256sums=('edbd53054308d9d21e6430c6d96702168a695147325ccf36c05c79f098280ddc')

build() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*whl
}
