#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgdesc="A dictionary-like class that inherits properties from PyTorch tensors"
pkgver=0.6.1
pkgrel=1
url="https://github.com/pytorch/tensordict"
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle' 'python-orjson')
makedepends=(python-wheel)
source=('https://github.com/pytorch/tensordict/releases/download/v0.6.1/tensordict-0.6.1-cp312-cp312-manylinux1_x86_64.whl')
sha256sums=('8e89cf15b62148f802c63dd2c3ce51483fd83ae1baccf828a4c165102cc58334')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
