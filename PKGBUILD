# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=7.10.1
pkgrel=1
pkgdesc='Finance tech: SEPA, EBICS & more'
arch=(any)
url="https://www.joonis.de/en/$_name/"
license=('custom:restricted use')
_pyminor=14
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" python-lxml python-cryptography python-certifi python-fpdf2 python-defusedxml)
makedepends=(python-installer)
_wheel="${_name/-/_}-$pkgver-cp3$_pyminor-none-any.whl"
source=("https://files.pythonhosted.org/packages/cp3$_pyminor/${_name::1}/$_name/$_wheel")
sha256sums=('d106ad5e6f39bbf8171ca267123f6f74e480b5b81a22ecc2456c17392c50574f')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
}
