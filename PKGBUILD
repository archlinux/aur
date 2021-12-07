# Maintainer: Anthony Wang <ta180m@pm.me>

pkgbase='python-jupyterlab-latex'
pkgname=('python-jupyterlab-latex')
_name='jupyterlab_latex'
pkgver=3.1.0
pkgrel=1
pkgdesc="JupyterLab extension for running LaTeX"
url="https://github.com/jupyterlab/jupyterlab-latex"
depends=('python' 'jupyterlab' 'jupyter-server')
makedepends=('unzip' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('ccfbb85599d0cb72bd07905c8a3ecfce5f777b395ee512338d5c6f32fbe7343b')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share"* "$pkgdir/usr/share"
        mv "$site/${_name/-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
