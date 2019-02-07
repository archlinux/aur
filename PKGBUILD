# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=1.3
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('1d93f7a833ed8a6e120ddc40db5c4763bc39bccc75c05081ec8285ece718aefb')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
