# Maintainer: Stick <stick@stma.is>

pkgname=python-roundrobin
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="This is rather small collection of round robin utilites"
arch=('any')
url='https://github.com/linnik/roundrobin'
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ac30cb78570a36bb0ce0db7b907af9394ec7a5610ece2ede072280e8dd867caa')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
