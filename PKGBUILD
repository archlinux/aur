# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=7.8.0
pkgrel=1
pkgdesc='Finance tech: SEPA, EBICS & more'
arch=(any)
url="https://www.joonis.de/en/$_name/"
license=('custom:restricted use')
_pyminor=13
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" python-lxml python-cryptography python-certifi python-fpdf2 python-defusedxml)
makedepends=(python-installer)
_wheel="${_name/-/_}-$pkgver-cp3$_pyminor-none-any.whl"
source=("https://files.pythonhosted.org/packages/cp3$_pyminor/${_name::1}/$_name/$_wheel")
sha256sums=('d17cae82cdb990de0bac37cf7ff9220e19f0c3b451937bfcfab8537b71015b2b')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
}
