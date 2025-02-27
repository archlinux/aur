#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.7.2
pkgrel=1
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson')
makedepends=(python-wheel)
source=('https://github.com/pytorch/tensordict/releases/download/v0.7.2/tensordict-0.7.2-cp313-cp313-manylinux1_x86_64.whl')
sha256sums=('42b190185fbc1174a8ec1512fb9b5b18752d8f597332dcd2b4fe712808d38f47')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
