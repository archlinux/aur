# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-schwifty
_name=${pkgname#python-}
pkgver=2023.3.0
pkgrel=1
pkgdesc="Validate/generate IBANS and BICS"
arch=('any')
url="http://github.com/mdomke/schwifty"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python>=3.7' 'python-iso3166' 'python-pycountry')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('527f49d58cedd3cd2f677af3a1551136931c00e6c14bc26c9f990440a515c5fd')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
