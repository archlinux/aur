# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-bash
pkgver=0.4.2
pkgrel=1
pkgdesc="An inline Bash script runner, for Python. "
arch=('any')
url="https://github.com/jpetrucciani/bash.py"
license=('APACHE')
groups=()
depends=("python-delegator")
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
sha256sums=('0c6d596111cd3e0be3b1e6f95eeb29200620a146df9cbf99f4ca0d4971cffc71')

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
}
