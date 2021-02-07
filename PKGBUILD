# Maintainer: Phil A. <flying-sheep@web.de>
_name=ipycytoscape
pkgname=jupyterlab-extension-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='Python implementation of the graph visualization tool Cytoscape.'
arch=(any)
url=https://pypi.org/project/$_name
license=(BSD)
depends=(jupyterlab)
provides=(python-ipycytoscape jupyter-cytoscape jupyterlab-extension-cytoscape)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('01b4579c7fd57acbea954ca161e5a13f84be0e36c10e8e05af8057c95c66475d')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/"* "$pkgdir/usr/"
}
