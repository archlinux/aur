# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=1.8.0
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
sha256sums=('63468bf62d82b27b1635ffe1c3f1c4e54ef67d0a6d38bedccc38ce6965d56db7')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
