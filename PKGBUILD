# Maintainer: Leo <i@setuid0.dev>
_pkgname=google-re2
_pkgver=1.0
pkgname=python-re2
pkgver="$_pkgver+20221201"
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
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$_pkgver.tar.gz")
noextract=()
sha256sums=('21c8adc296360de1ff426baa38c712eada622c2858d195eb487e415d94194e91')
validpgpkeys=()

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py build
}

check() {
	:
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
