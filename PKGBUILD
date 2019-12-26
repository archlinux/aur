# Maintainer: Philipp A. <flying-sheep@web.de>

_name=tbvaccine
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc='Pretty-print Python tracebacks'
arch=(any)
url="https://github.com/skorokithakis/$_name"
license=(MIT)
depends=(python)
makedepends=(install-wheel-scripts)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/3.6/${_name::1}/$_name/$_wheel")
sha256sums=('3aae41b75e237f2840dde274722b1070ca43d65dd24cf60344bd6d345c77cc3d')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
