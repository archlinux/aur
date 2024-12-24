# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
_name=${pkgname#python-}
_commit=2b4d0bbef8354aa6fbdee8ff4b7da95a35922a9a
pkgver=0.5.14
pkgrel=3
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
depends=('python-docopt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/savoirfairelinux/num2words/archive/${_commit}.tar.gz")
sha256sums=('965f1320cb28fed5c12da95e55f75cbda46e9c95da858831cf2234a5339a6b02')

build() {
    cd $_name-$_commit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$_commit
    python -m installer --destdir="$pkgdir" dist/*.whl
}
