# Maintainer: berocs <brandweineric at gmail dot com>
pkgname=python-simperium
_pkgname=Simperium3
pkgver=0.1.3
pkgrel=1
pkgdesc="Python 3 client for the Simperium synchronization platform"
arch=(any)
url="https://github.com/swalladge/simperium-python3"
license=("MIT")
depends=('python-requests')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/6a/57/6770190250f0c60e19ced27ca16791cf675afbb4570f45f05d4dc7949ff2/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("d71ce5923b04b9853c7fc500a466ac724a767b5e33616c122564a71165233cc8")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
