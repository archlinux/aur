# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-delegator
pkgver=0.1.1
pkgrel=1
pkgdesc="Subprocesses for Humans 2.0."
arch=('any')
url="https://github.com/amitt001/delegator.py"
license=('MIT')
groups=()
depends=("python-pexpect")
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('b3972940cb0dbb8cf9e16caffaf188779bb87a67ca71f629ee983ce31114b723')

prepare() {
	rm -rf "$pkgname-$pkgver"
	mv "${pkgname#python-}.py-$pkgver" "$pkgname-$pkgver" || true
}

build() {
	cd "$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
