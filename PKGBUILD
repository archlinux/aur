_name=pyefd
pkgname=python-$_name
pkgver=1.6.0
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
sha256sums=('3c0bff21bdd00a8f1da69618ed61ea5b8a38d94c7ff5556073716aae0f66c8a2')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
