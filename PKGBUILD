# Maintainer: Leo <i@setuid0.dev>
_pkgname=google-re2
pkgname=python-re2
pkgver=0.0.7
pkgrel=2
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
sha256sums=('ce75309cdbec726e9b518ca79de081a9235476e56a9b2a9b2ef4fd1bab04b09c')
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
