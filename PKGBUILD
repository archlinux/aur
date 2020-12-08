_name=mizani
pkgname=python-$_name
pkgver=0.7.2
pkgrel=1
pkgdesc='Scales for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(BSD)
depends=(
	python
	python-numpy
	python-pandas
	python-matplotlib
	python-palettable
)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('8a8035f6b3b8294378e21acb24d742896b27b471cfd14cd8da8a0ccd9adf3cb5')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
