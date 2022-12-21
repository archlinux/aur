# Maintainer: Anthony Wang <a aat exozy dot me>

pkgname=python-jupyter-server-terminals
_name=jupyter-server-terminals
pkgver=0.4.3
pkgrel=1
pkgdesc='A Jupyter Server Extension Providing Terminals'
arch=(any)
url=https://github.com/jupyter-server/jupyter_server_terminals
license=(BSD)
makedepends=('unzip' 'python-setuptools')
depends=(python python-terminado jupyter-server)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('ec67d3f1895d25cfb586a87a50b8eee13b709898a4afd721058e551e0a0f480d')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name//-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
