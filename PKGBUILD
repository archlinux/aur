# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=2.1.0
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('494e0806840fe896fe31ce2a413583115324f12177ecaf7427f157caa9b9c5b2')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
