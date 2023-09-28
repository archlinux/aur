# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.11.0
pkgrel=1
pkgdesc="The fsleyes-props project is an event programming framework, which includes the ability for automatic CLI generation and, optionally, automatic GUI generation (if wxPython is present). It is used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-wxpython' 'fslpy>=3.13.2' 'fsleyes-widgets>=0.14.3' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/fsleyes/${pkgname#fsleyes-}/-/archive/${pkgver}/${pkgname#fsleyes-}-${pkgver}.tar.gz")
sha256sums=('0dee733abd966d559483ee5b39debdc8710e04859468e64f12a6b3433ae78436')

build() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}
