# Maintainer: Leo <i@setuid0.dev>
_pkgname=google-re2
pkgname=python-re2
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="RE2 Python bindings"
arch=('any')
url="https://github.com/google/re2"
license=('BSD')
groups=()
depends=('re2>=1:20230801-1')
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
sha256sums=('d3a9467ee52b46ac77ca928f6d0cbeaccfd92f03ca0f0f65b9df6a95184f3a1c')
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

check() {
	:
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
