# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-json-stream
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple streaming JSON parser."
arch=('any')
url="https://github.com/daggaz/json-stream/"
license=('MIT')
groups=()
depends=("python-requests" "python-wheel" "python-twine" "python-naya")
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
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	LICENSE::https://raw.githubusercontent.com/daggaz/json-stream/master/LICENSE.txt
)
noextract=()
sha256sums=(
	'f5e614f1cca8a70a5da98107744ae2c6f5be02a8af8f39f3a556dc6258225e65'
	'6976190fe77b60b04ae11ac91674aa4883564b607a43e7c886d09db725d8d64c'
)

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
