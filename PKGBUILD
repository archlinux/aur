# Maintainer: Morten Linderud <morten@linderud.pw>  
_pkgname='testinfra'
pkgbase="python-testinfra"
pkgname=("python-testinfra" "python2-testinfra")
pkgver=1.6.5
pkgrel=1
pkgdesc='Testinfra test your infrastructures'
url='https://github.com/philpep/testinfra'
arch=('any')
license=('Apache')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/philpep/testinfra/archive/${pkgver}.tar.gz")
sha256sums=('e05a6e19bd57d328d788215ce344b4e0d5543bd518fbab0c0d9bfbb118730c0c')


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-testinfra() {
    depends=('python-pytest' 'python-six')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-testinfra() {
    depends=('python2-pytest' 'python2-six')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ft=sh ts=2 sw=2 et:
