# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.11.0
pkgrel=2
pkgdesc="A wrapper around protocol buffers."
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
optdepends=('python-google-api-core: Testing')
makedepends=('python'
	'python-setuptools')
depends=("python-protobuf")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('416a0f13987789333cd8760a0ee998f8eccd6d7165ee9f283d64ca2de3e8774d')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
