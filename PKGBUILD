pkgname=python-sphinxcontrib-spelling
_name=sphinxcontrib_spelling
pkgver=7.1.0
pkgrel=1
pkgdesc='Sphinx spelling extension'
arch=(any)
url='https://github.com/sphinx-contrib/spelling'
license=('BSD')
depends=('python-sphinx' 'python-pyenchant')
makedepends=('unzip')
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('e44d101a15b2e5798f76e9256917dcdc03719b7da6436cbdbbb99a14a5d0cbaa')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
