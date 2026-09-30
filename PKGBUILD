# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-ibonds
_name=ibonds
pkgver=1.0.8
pkgrel=1
pkgdesc="Library to calculate the current value of a Series I Savings Bond (I Bond)"
arch=('any')
url="https://github.com/sarvjeets/ibonds"
license=('MIT')
depends=('python' 'python-pyyaml' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dcbd432fd73a74d1fe418170a72cdfc4b84d6e24b45315d0804cd4ffab251b5e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
