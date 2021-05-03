# Maintainer: Phil A. <flying-sheep@web.de>
_name=jupyterlab-git
pkgname=jupyterlab-extension-jupyterlab_git
pkgver=0.30.1
pkgrel=1
pkgdesc='Git extension for JupyterLab'
arch=(any)
url=https://github.com/jupyterlab/$_name
license=(BSD)
depends=(jupyterlab jupyter-server python-nbdime python-packaging python-pexpect)
makedepends=(unzip)
provides=(jupyterlab-extension-git python-jupyterlab-git)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('a596a293dc562f03ec1af48cb717b4f8a7f1c118a3e4cd13ea138e077674a638')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/"* "$pkgdir/usr/"
}
