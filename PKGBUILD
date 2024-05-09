# Maintainer: Leo <i@setuid0.dev>
_pkgname=google_re2
pkgname=python-re2
pkgver=1.1.20240501
pkgrel=1
epoch=
pkgdesc="RE2 Python bindings"
arch=('any')
url="https://github.com/google/re2"
license=('BSD')
groups=()
depends=('re2>=1:20240501-1')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'pybind11' 'python-installer')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('1a291ae834ec4230c71671b0162999ec76c0b88fbd33ab4d362a07fa9a7d37b4')
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	:
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
