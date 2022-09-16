# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=7.2.6
pkgrel=1
pkgdesc='Finance tech: SEPA, EBICS & more'
arch=(any)
url="https://www.joonis.de/en/$_name/"
license=('custom:restricted use')
_pyminor=10
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" python-lxml python-cryptography python-certifi 'python-fpdf>=1.7.2' python-defusedxml)
makedepends=(python-installer)
_wheel="${_name/-/_}-$pkgver-cp3$_pyminor-none-any.whl"
source=("https://files.pythonhosted.org/packages/cp3$_pyminor/${_name::1}/$_name/$_wheel")
sha256sums=('f720f895d91c937f6d0c1d496ef12c357ec9713bad6a1a4f65af66cdee874924')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
}
