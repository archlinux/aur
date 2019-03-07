# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=5.2.1
pkgrel=1
pkgdesc=''
arch=(any)
url="https://github.com/theislab/$_name"
license=('custom:restricted use')
depends=(python-certifi 'python-fpdf>=1.7.2' python-lxml)
_pyarch=cp37
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('3239606d6d30fce6b0cac405b2696366d0b57ff5bffb281e7ecaec3fc2004d25')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
