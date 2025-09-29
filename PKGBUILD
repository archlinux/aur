# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.15.1
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
sha256sums=('8b94b8f68cbcd1cf4e4c3350970634a8549be0b3d5d383da75f0f12a46c15624')

build() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_fsleyes_widgets=${pkgver} python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*whl
}
