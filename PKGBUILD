# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=python-desec-dns-api
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python library wrapper for deSEC DNS API used by desec-dns-cli and ansible-desec-dns"
arch=(any)
url="https://gitlab.com/xengi/desec-dns-api"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
#checkdepends=('python-responses' 'python-pytest' 'python-pytest-xdist' 'python-pytest-flake8')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c5c307de16c2f802b786e01bf5324d53db157ae2f4a95102c5b5aaaf50ee08db')

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

