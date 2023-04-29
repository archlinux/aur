# Maintainer: pryme-svg <edoc.www@gmail.com>
# Co-maintainer: Coriollis <nixillomax@live.com.mx>

pkgname=resolve-march-native
pkgver=2.2.0
pkgrel=1
pkgdesc="Tool to determine what GCC flags -march=native would resolve into"
arch=('any')
url="https://github.com/hartwork/resolve-march-native"
license=('GPL')
depends=('python>=3.7')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4d41033a3d5890f42dcf4b42f2363b43e477e2d3386ed7b4afa4392d8a553506')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	python setup.py build
}

check(){
    cd "$srcdir/$pkgname-$pkgver"

    pytest
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	python setup.py install --root="${pkgdir}/" --skip-build --optimize=1
}
