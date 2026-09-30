# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-ibonds
_name=ibonds
pkgver=1.0.9
pkgrel=1
pkgdesc="Library to calculate the current value of a Series I Savings Bond (I Bond)"
arch=('any')
url="https://github.com/sarvjeets/ibonds"
license=('MIT')
depends=('python' 'python-pyyaml' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9100dbe0657287d3e282e6de8ed8eee55c4ccdd068d9fb7ce8fe9b6998e3f68b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
