# Maintainer: Michał Pałubicki <maln0ir@gmx.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=leather
pkgname=python-$_pkgname
pkgver=0.3.3
pkgrel=3
pkgdesc='Python charting for 80% of humans'
arch=('any')
url='https://leather.readthedocs.io/'
license=('MIT')
depends=('python'
         'python-six')
makedepends=('python-setuptools')
checkdepends=('python-cssselect'
              'python-lxml')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/wireservice/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('70f621f7c5ddac6bc3261850134c0187cb200844243eb878a29f8a8f15a8db46')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test --test-suite=tests
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
