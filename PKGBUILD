# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
_name=${pkgname#python-}
pkgver=0.5.13
pkgrel=3
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
depends=('python-docopt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/savoirfairelinux/num2words/archive/v${pkgver}.tar.gz")
sha256sums=('79816a3a162c0563fe8149373d945966a941f6b34922960d7d3fd64275cb7c77')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
