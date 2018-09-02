# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=1.1
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('178e6865185b1802aa3b1944f4957d2c83fc56294dc8047d2c4722131f696e61')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
