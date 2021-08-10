# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-future-annotations
_name="future_annotations"
pkgver=1.0.0
pkgrel=2
pkgdesc="A backport of __future__ annotations to python<3.7"
url="https://github.com/asottile/future-annotations"
depends=(
    'python'
    'python-tokenize-rt'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c707d19f7c74e08d9e67b310fd6a7438ff510ba5cbfb7334695627f8f69c6378')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
