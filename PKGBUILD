# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-sureal
pkgver=0.6.2
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('Apache')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/Netflix/sureal/archive/v${pkgver}/sureal-${pkgver}.tar.gz")
sha256sums=('2ce477ac79d165ffcf52f846b586bfeff102265ca6cf281db79fa55d83c8a736')

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
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
