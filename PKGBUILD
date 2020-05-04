# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sauce-finder
pkgver=2.2.2
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/$pkgname"
license=('GPL3')
groups=()
depends=("python-requests" "python-validators" "python-click" "python-prompt_toolkit")
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
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
noextract=()
sha256sums=('0e600d2a9adcd99627c1cd23da975f58848a3787b65f9226d1e054224f9a0166')

build() {
	cd "$pkgname-v$pkgver"

	python setup.py build
}

package() {
	cd "$pkgname-v$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
