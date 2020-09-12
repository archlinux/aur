# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-sureal
pkgver=0.6.1
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('Apache')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/Netflix/sureal/archive/v${pkgver}/sureal-${pkgver}.tar.gz")
sha256sums=('6c024cd1afaf7adc0495d762c9de6e9d9c0a2de5a3f41191a642d9cd99bdb256')

build() {
    cd "sureal-${pkgver}"
    python setup.py build
}

check() {
    cd "sureal-${pkgver}"
    pytest
}

package() {
    cd "sureal-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
