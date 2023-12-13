#  Maintainer: Vincent Lequertier <vincent at vl8r dot eu>
pkgname=python-tensordict
pkgver=0.2.1
pkgrel=1
arch=(x86_64)
license=('MIT')
depends=('python' 'python-cloudpickle')
makedepends=(python-wheel)
source=('https://github.com/pytorch/tensordict/releases/download/v0.2.1/tensordict-0.2.1-cp311-cp311-manylinux1_x86_64.whl')
sha256sums=('516c0cf63418235f829490c93fc5f8ce579ca2c1f67653c8e0e77e6aa6f6117d')


package() {
	cd "$srcdir"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	install -Dm644 "tensordict-${pkgver}".dist-info/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
