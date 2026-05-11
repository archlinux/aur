#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-pyvers
pkgdesc="A Python library for dynamic dispatch based on module versions and backends."
pkgver=0.2.2
pkgrel=1
url="https://github.com/vmoens/pyvers"
arch=(any)
license=('MIT')
depends=('python')
makedepends=(python-wheel)
source=("https://github.com/vmoens/pyvers/releases/download/v${pkgver}/pyvers-${pkgver}-py3-none-any.whl")
sha256sums=('c4696408a0b15fbaa90df33d3bc579cf23a74a73541858f5470216f12f51f3b1')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "pyvers-${pkgver}".dist-info/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
