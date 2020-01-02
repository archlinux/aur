# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=6.1.1
pkgrel=1
pkgdesc='Finance tech: SEPA, EBICS & more'
arch=(any)
url="https://www.joonis.de/$_name"
license=('custom:restricted use')
depends=(python-certifi 'python-fpdf>=1.7.2' python-lxml)
_pyarch=cp38
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('01cdf6e983b335601b53db04d6fd29a95c6906e88c89336fd20fc6985a1a1bdc')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
