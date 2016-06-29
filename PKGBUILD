_name=unicodedata2
pkgname="python-$_name"
pkgver=8.0.0
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('i686' 'x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
md5sums=('dd870b5db5db41a7f2e923ba90b432a8')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
