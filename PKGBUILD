# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=7.8.5
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
sha256sums=('2741c0fdccb172ee74e0e761e6323cadcdb1f3644f0c62b9d2eb4c79ed099f47')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
}
