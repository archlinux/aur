# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=python-desec-dns-api
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library wrapper for deSEC DNS API used by desec-dns-cli and ansible-desec-dns"
arch=(any)
url="https://gitlab.com/xengi/desec-dns-api"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
#checkdepends=('python-responses' 'python-pytest' 'python-pytest-xdist' 'python-pytest-flake8')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e5333c456c8affee396f9d900c1cb5ebf070d6eb5de19418175bb4f00b031de7')

#check(){
#    cd "${srcdir}/${_name}-${pkgver}"
#    pytest --flake8 tests/
#}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

