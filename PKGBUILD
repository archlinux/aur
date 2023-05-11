# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.7.2
pkgrel=1
pkgname=python-scooby
_name=${pkgname#python-}
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('72eb95e79bd976cd7800d4caf8f15eb0f55ec3b9f33c1b1cd5323143fc0cd479e53fdca0ed64b1dfbac7d681ae3d6907daf7832e856c2ccb86d212ad1020abd7')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
