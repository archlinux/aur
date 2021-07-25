# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=resolve-march-native
pkgver=1.0.0
pkgrel=3
pkgdesc="Tool to determine what GCC flags -march=native would resolve into"
arch=('any')
url="https://github.com/hartwork/resolve-march-native"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a6d0f16db19d6bc69beca026d43a82d4282e354bf5aaa76e54b0a224a5156946')

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
