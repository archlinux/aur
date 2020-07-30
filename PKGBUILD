# Maintainer: Philipp A. <flying-sheep@web.de>

_name=stdlib-list
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='A list of Python Standard Libraries (2.6-7, 3.2-8).'
arch=(any)
url="https://github.com/theislab/$_name"
license=(MIT)
depends=(python)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('0ed79a0badf4f666aad046cde364ccac68ca1438a211ec74b0153e0eb5642a3e')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
