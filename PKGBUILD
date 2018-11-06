# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=1.9.0
pkgrel=1
pkgdesc='Cross-distribution Linux wheels'
arch=(any)
url="https://github.com/pypa/auditwheel"
license=(MIT)
depends=(python python-pyelftools)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
noextract=("$_wheel")
sha256sums=('daa496bb307012502dd70ba6116b14e28849a30e93b290fb403e83b4926c8918')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
