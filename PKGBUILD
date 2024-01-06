# Maintainer: pryme-svg <edoc.www@gmail.com>
# Co-maintainer: Coriollis <nixillomax@live.com.mx>

pkgname=resolve-march-native
pkgver=5.0.2
pkgrel=1
pkgdesc="Tool to determine what GCC flags -march=native would resolve into"
arch=('any')
url="https://github.com/hartwork/resolve-march-native"
license=('GPL')
depends=('python>=3.7')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b22a408479889afab5e1a877caae8d9534f4285fbdaa8f552bbdc8b13f063ed1')

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
