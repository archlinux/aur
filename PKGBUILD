# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=python-simber
pkgver=0.2.5
pkgrel=0
pkgdesc="Simple, minimal, powerful logging library for Python"
arch=("any")
url="https://github.com/deepjyoti30/simber"
license=('MIT')
depends=(
		"python>=3.6"
		"python-colorama"
		)
makedepends=("git" "python-setuptools")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/deepjyoti30/simber/archive/0.2.5.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "simber-${pkgver}"
	python setup.py build
}

package() {
	cd "simber-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
