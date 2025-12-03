# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=sklearn-compat
pkgname=python-${_name,,}
pkgver=0.1.4
pkgrel=1
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
sha256sums=(52b67b2e6cd3117f690fbfb5a522b633da6c6dd22da54f03b946f2ecc6b146eb)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
