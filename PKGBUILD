# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=extra-streamlit-components
pkgname=python-$_name
pkgver=0.1.81
pkgrel=1
pkgdesc='Extra UI components for Streamlit: tab bar, stepper bar, cookie manager, router'
arch=(any)
url='https://github.com/Mohamed-512/Extra-Streamlit-Components'
license=(Apache-2.0)
depends=(
  python
  python-streamlit
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('eb9beb7bacfe8b3d238f1888a21c78ac6cfa569341be484bca08c3ea0b15f20d')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
