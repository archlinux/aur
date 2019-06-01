# Maintainer: fenuks

pkgname=covimerage
pkgver=0.1.6
pkgrel=1
pkgdesc="Generate coverage information for Vim scripts."
arch=("any")
url="https://github.com/Vimjas/${pkgname}"
license=("GPL3")
depends=("python-coverage" "python-click" "python-attrs")
# optdepends=()
makedepends=("python-setuptools")  
conflicts=("${pkgname}")
# install=$pkgname.install
# source=("https://github.com/Vimjas/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/c4/94/8d0958970e07ef894630cddce516f954b19880ac905642ff689564cfc5cd/covimerage-0.1.6.tar.gz")
sha256sums=('af95cc19e19bc80ce264cc3ef97ca44dd7b5ebe1f8d0e48c7a7d50a2b7f1f48a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
