# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy-scripts
pkgver=1.1.3
pkgrel=1
pkgdesc='Scripts for using scanpy from the command line'
arch=(any)
url='https://github.com/ebi-gene-expression-group/scanpy-scripts'
license=(MIT)
depends=(scanpy python-click)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${pkgname/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('c3dddc6acb90cfc610fb87da9e0407b10541c904fc4d21a3850941a094604675')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
