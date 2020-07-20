pkgname=python-sphinxcontrib-sadisplay
_name=sphinxcontrib_sadisplay
pkgver=0.3.3.dev20180712
pkgrel=1
pkgdesc='Sphinx "sadisplay" extension'
arch=(any)
url='https://github.com/sphinx-contrib/sadisplay'
license=('BSD')
depends=('python-sphinx' 'python-sadisplay')
makedepends=('unzip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/3.6/${_name::1}/$_name/$_wheel")
sha256sums=('9a9a99fdcc2f9790bb23242f725ab999a94ae52fa6bb32ec8d2c20a83b9cc6c7')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
