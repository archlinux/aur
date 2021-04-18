# Maintainer: Leo <i@setuid0.dev>
_pkgname=google-re2
pkgname=python-re2
pkgver=0.1.20210401
pkgrel=1
epoch=
pkgdesc="RE2 Python bindings"
arch=('any')
url="https://github.com/google/re2"
license=('BSD')
groups=()
depends=('re2')
makedepends=('python-setuptools' 'pybind11')
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
sha256sums=('9565650d9b89b17b7bf5edd75bf749384d3f0201bcda68ca1783b0e9716efd66')
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
