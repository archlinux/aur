#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.12.1
pkgrel=2
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson' 'python-pyvers')
makedepends=(python-wheel)
source=("https://github.com/pytorch/tensordict/releases/download/v${pkgver}/tensordict-${pkgver}-cp314-cp314-manylinux_2_28_${arch}.whl")
sha256sums=('79a29c26a1a69ee1372b9cacf7e8bbc8a7dff52ffb335d55da09371a804e178b')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
