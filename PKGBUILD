# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=crossandra
pkgname=python-$_pkgname
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc='A simple, configurable tokenizer for python operating on enums'
arch=(x86_64)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.9' 'python-result')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'mypy')
checkdepends=()
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('e78e961d6543466ab4b1b491026e7da87b1b795407353c87e69c7facb4636f01')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
