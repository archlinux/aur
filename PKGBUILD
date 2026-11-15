#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.15.6
pkgrel=1
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson' 'python-pyvers')
makedepends=(python-wheel)
source=("https://github.com/pytorch/tensordict/releases/download/v${pkgver}/tensordict-${pkgver}-py3-none-any.whl")
sha256sums=('fd4dc096ad5f98d9418a90ed572fdb1d1f1f3286c82b7dc138e9a4130a6ba5c3')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps tensordict-${pkgver}-py3-none-any.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
