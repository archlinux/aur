# Maintainer: Philipp A. <flying-sheep@web.de>

_name=headerparser
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc='argparse for mail-style headers'
arch=(any)
url="https://github.com/jwodder//$_name"
license=(MIT)
depends=(python-six)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('216ecee4a995c88c66764814c47c86109cf9fef564105a5a024d6efa6cdfb2b2')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
