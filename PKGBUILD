# Maintainer: FuzzyMidnight <>
# Contributor: pryme-svg <edoc.www@gmail.com>
# Contributor: Coriollis <nixillomax@live.com.mx>

pkgname=resolve-march-native
pkgver=6.0.1
pkgrel=1
pkgdesc="Tool to determine what GCC flags -march=native would resolve into"
arch=('any')
url="https://github.com/hartwork/resolve-march-native"
license=('GPL-2.0-or-later')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a8c7d223f31197cadba67eebbf5385de76bb0bf873fffc48c5a59375d170f28a')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
