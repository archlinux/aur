# Maintainer: Otreblan <otreblain@gmail.com>

_name=blend-modes
pkgname="python-$_name"
pkgver=2.1.0
pkgrel=1
pkgdesc="Image processing blend modes"
arch=('any')
url="https://github.com/flrs/blend_modes"
license=('MIT')
groups=()
depends=("python-numpy")
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('0a3145e4792e005764b9663f5ce899d30f7c24f4bcff00428907d03dbe068f37')

build() {
	cd "$srcdir/${_name/-/_}-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name/-/_}-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
