_name=pyefd
pkgname=python-$_name
pkgver=1.4.0
pkgrel=1
pkgdesc='Elliptic Fourier Features of a Closed Contour'
arch=(any)
url="https://github.com/hbldh/$_name"
license=(MIT)
depends=(python-numpy)
_pyarch=py2.py3
_wheel="$_name-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('b46c5b9b7e98f40a64d34bdf03d8d5c1290f663cabf1be18a0abb6f89804d77b')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
