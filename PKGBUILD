# Maintainer: FuzzyMidnight <>
# Contributor: pryme-svg <edoc.www@gmail.com>
# Contributor: Coriollis <nixillomax@live.com.mx>

pkgname=resolve-march-native
pkgver=5.1.0
pkgrel=1
pkgdesc="Tool to determine what GCC flags -march=native would resolve into"
arch=('any')
url="https://github.com/hartwork/resolve-march-native"
license=('GPL-2.0-or-later')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6695a4ae9188656b81364ae18e99fd53588faa9b2bb6a8010a1f7f4c56d60de7')

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
