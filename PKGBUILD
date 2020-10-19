_name=pyefd
pkgname=python-$_name
pkgver=1.4.1
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
sha256sums=('cc7d5bcac05d0d9d1fc897374972692c29c5dd5feb306c10018043d622e17541')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
