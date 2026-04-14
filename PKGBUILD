# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-banal
_pkg="${pkgname#python-}"
pkgver=1.1.0
pkgrel=2
pkgdesc="Commons of banal micro-functions for Python."
license=('MIT')
arch=('any')
url="https://github.com/pudo/banal"
depends=('python')
makedepends=('python-installer')
source=("banal-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/da/87/c6d008dceb17670f7e0fa6a0031456f56076d30e42128b92f5f517de3048/banal-$pkgver-py3-none-any.whl")
sha256sums=('0aa79cc784291ea94882f7022799fee419c7d20e81369f527519f95fe025a285')

latestver() {
	curl -fsSL "https://pypi.org/pypi/${_pkg}/json" | jq -r '.info.version'
}

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" "$srcdir"/banal-$pkgver-py3-none-any.whl
	install -Dm644 "$srcdir"/banal-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
