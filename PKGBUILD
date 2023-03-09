# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server
pkgver=0.1.7
pkgrel=1
pkgdesc="Python based cmake language server"
arch=('any')
url="https://github.com/regen100/cmake-language-server"
license=('MIT')
groups=()
depends=("python-pygls" "python-pyparsing" "cmake-format" "cmake")
makedepends=("python-build" "python-installer" "python-pdm")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('40943df341d4278d99114223be86f874077a4462c52779dd178edaefa2d76fc5')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
