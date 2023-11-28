# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
_name=cvprac
pkgname=python-cvprac
pkgver=1.3.1
pkgrel=1
pkgdesc="Arista CloudVision Portal REST API Client for Python"
arch=('any')
url="https://github.com/aristanetworks/cvprac"
license=('BSD-3-Clause')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('6dae5518602f0f891b17e57ffce4315f3b6ae46ad4d744ef972afea617fc596b0dcf1b978ff626f6113d03743bec83fe562ad86a252772d67331dc3b164c957c')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
