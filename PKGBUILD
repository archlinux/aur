# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=1.9.0
pkgrel=1
pkgdesc='Cross-distribution Linux wheels'
arch=(any)
url="https://github.com/pypa/auditwheel"
license=(MIT)
depends=(python-wheel python-pyelftools)
_pyarch=py3
_wheel="$pkgname-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('daa496bb307012502dd70ba6116b14e28849a30e93b290fb403e83b4926c8918')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
}
