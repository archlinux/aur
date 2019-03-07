# Maintainer: Philipp A. <flying-sheep@web.de>

_name=modulegraph
pkgname=python-modulegraph
pkgver=0.17
pkgrel=1
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://bitbucket.org/ronaldoussoren/$_name"
license=('MIT')
depends=('python' 'python-altgraph')
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('9991538487efaa2d77b78bded12f7ba223f1a143f8ad75ed6484afa70b3d47e1')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
