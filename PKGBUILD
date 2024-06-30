# Maintainer: Leo <i@setuid0.dev>
_pkgname=google_re2
pkgname=python-re2
pkgver=1.1.20240702
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
sha256sums=('8788db69f6c93cb229df62c74b2d9aa8e64bf754e9495700f85812afa32efd2b')
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
