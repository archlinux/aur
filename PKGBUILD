# Original maintainer: Stuart Mumford <stuart@cadair.com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-databpy
_module_name=databpy
pkgver=0.1.0
pkgrel=1
pkgdesc="A set of data-oriented wrappers around the python API of Blender."
arch=(any)
url="https://bradyajohnston.github.io/databpy/"
license=('GPL')
depends=(
    'python-numpy'
    'blender'
)
makedepends=()
optdepends=()
options=(!emptydirs)
source=("https://pypi.io/packages/source/d/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('45aa729474a64f3f51eaa5d0e34d4748104b395b1c569ec5869252f4389aa35f')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
