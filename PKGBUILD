# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=6.6.5
pkgrel=1
pkgdesc='Finance tech: SEPA, EBICS & more'
arch=(any)
url="https://www.joonis.de/en/$_name/"
license=('custom:restricted use')
_pyminor=9
depends=("python>=3.$_pyminor" "python<3.$((_pyminor + 1))" python-certifi 'python-fpdf>=1.7.2' python-lxml)
_pyarch=cp3$_pyminor
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('01cdf6e983b335601b53db04d6fd29a95c6906e88c89336fd20fc6985a1a1bdc')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/python3.$_pyminor/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
