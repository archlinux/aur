#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.5.0
pkgrel=1
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson')
makedepends=(python-wheel)
source=('https://github.com/pytorch/tensordict/releases/download/v0.5.0/tensordict-0.5.0-cp312-cp312-manylinux1_x86_64.whl')
sha256sums=('c804d9c58fb9af09d8298c2c2214b393f380621ce72f44cb6bd89462768a1621')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
