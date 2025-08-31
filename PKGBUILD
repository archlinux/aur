#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.9.1
pkgrel=1
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson')
makedepends=(python-wheel)
source=("https://github.com/pytorch/tensordict/releases/download/v${pkgver}/tensordict-${pkgver}-cp313-cp313-manylinux_2_28_${arch}.whl")
sha256sums=('3ffd535fe7a0d7f66623ddce2a6e2271a18cc70da198311f807227f664f468df')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
