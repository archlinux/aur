# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=1.0
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('5eba92b254f198e534855919c1596d68bb46a7ee2adab60037df6268672dba38')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
