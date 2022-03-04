# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=python-enocean-git
_name="enocean"
pkgver=0.31.r174.80a253b
pkgrel=1
pkgdesc="EnOcean library for Python"
arch=("any")
url="https://github.com/kipe/enocean"
license=('MIT')
groups=()
depends=('python' 'python-enum-compat' 'python-beautifulsoup4' 'python-pyserial')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${_name}::git+https://github.com/kipe/enocean.git")
noextract=()
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_name}"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1
}
