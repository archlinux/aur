# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=sklearn-compat
pkgname=python-${_name,,}
pkgver=0.1.3
pkgrel=2
pkgdesc='Ease support for compatible scikit-learn estimators across versions'
arch=('any')
url="https://github.com/sklearn-compat/sklearn-compat"
license=('BSD3-Clause')
depends=('python>=3.8'
	 'python-scikit-learn>=1.2'
)
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(a8aaf8ef711988cbd63f187c5560b5f16b25df663aaa1d2d0e1291341d339f80)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
