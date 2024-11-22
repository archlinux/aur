# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
_name=${pkgname#python-}
pkgver=0.5.14
pkgrel=1
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
depends=('python-docopt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/savoirfairelinux/num2words/archive/v${pkgver}.tar.gz")
sha256sums=('5cf85c854669e66bc71a25d85c13b803ba598f157d1df8329069eb9d22e68721')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
