# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

_name='thefuzz'
pkgname="python-$_name"
pkgver=0.19.0
pkgrel=1
pkgdesc='Fuzzy string matching like a boss'
arch=('any')
url="https://github.com/seatgeek/thefuzz"
license=('LGPL')
depends=('python' 'python-levenshtein')
makedepends=('python-setuptools')
checkdepends=('python-pycodestyle' 'python-hypothesis' 'python-pytest')
source=(
	"git+$url.git"
)
sha256sums=('SKIP')

build() {
	cd "$_name"
	python setup.py build
}

check() {
	cd "$_name"
	pytest
}

package() {
	cd "$_name"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=4 sw=4 et:
