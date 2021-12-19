pkgname=python-sphinxcontrib-sadisplay
_name=sphinxcontrib_sadisplay
pkgver=0.3.5.dev20210512
pkgrel=1
pkgdesc='Sphinx "sadisplay" extension'
arch=(any)
url='https://github.com/sphinx-contrib/sadisplay'
license=(BSD)
depends=(python-sphinx python-sadisplay)
_wheel="$_name-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('0f61e95f226349aff6b72d7c9faf2690107867adcc150f741856797e4bccae66')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
