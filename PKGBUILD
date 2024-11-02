# Maintainer: Phil A. <flying-sheep@web.de>
_name=ipycytoscape
pkgname=jupyterlab-extension-$_name
pkgver=1.3.3
pkgrel=1
pkgdesc='Python implementation of the graph visualization tool Cytoscape.'
arch=(any)
url=https://pypi.org/project/$_name
license=(BSD)
depends=(jupyterlab python-ipywidgets python-spectate)
makedepends=(python-installer)
provides=(python-ipycytoscape jupyter-cytoscape jupyterlab-extension-cytoscape)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('4bc205724971f5f7a3fc2b09dfec20c357c4c6dfa2b4bd41e7c33c995c3f6906')
noextract=("$_wheel")

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
	mv "$pkgdir/usr/etc" "$pkgdir/"

	#cd "$srcdir/$_name-$pkgver"
	#install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
