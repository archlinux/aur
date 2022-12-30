# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-schwifty
_name=${pkgname#python-}
pkgver=2022.9.0
pkgrel=1
pkgdesc="Validate/generate IBANS and BICS"
arch=('any')
url="http://github.com/mdomke/schwifty"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=('python>=3.7' python-iso3166 python-pycountry)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('ff3c4ad2951f8391b9c3d13e401b751f5d8b77981673e59a91074d5513121620')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
