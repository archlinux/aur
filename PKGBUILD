# Maintainer: Philipp A. <flying-sheep@web.de>

_name=fintech
pkgname=python-$_name
pkgver=5.2.0
pkgrel=1
pkgdesc=''
arch=(any)
url="https://github.com/theislab/$_name"
license=('custom:restricted use')
depends=(python-certifi 'python-fpdf>=1.7.2' python-lxml)
makedepends=(python-pip)
_wheel="$_name-$pkgver-cp37-none-any.whl"
source=("https://files.pythonhosted.org/packages/cp37/${_name::1}/$_name/$_wheel")
sha256sums=('ff189b7c97f4600d49f25a960e5faf28c3b2dd16efeab494776e2c7a80393e78')
noextract=("$_wheel")

package() {
	cd "$srcdir"
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
