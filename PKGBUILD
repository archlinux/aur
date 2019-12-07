# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata2ri
pkgname=python-$_name
pkgver=1.0.1
pkgrel=2
pkgdesc='Converter between Python’s AnnData and R’s SingleCellExperiment.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-anndata python-rpy2 python-tzlocal)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('9f035cef8fba49aba504ba74fcfbb366b1e5ea2499bff5d99c9f13fa096eb130')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
}
