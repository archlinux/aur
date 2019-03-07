# Maintainer: Philipp A. <flying-sheep@web.de>

_name=unicodedata2
pkgname="python-$_name"
pkgver=11.0.0
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('i686' 'x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('92197bf855c4b449d99328d1eee28b8295076ec99cdf21f2b6d62d45ff71c3ab')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
