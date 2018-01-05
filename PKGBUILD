# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=0.13
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('26bf9a3a9b743fed085420b4eed24f78341c0d2103a5f726980f7e7750400e81')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
