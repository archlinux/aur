# Maintainer: Morten Linderud <morten@linderud.pw>  

pkgbase="python-giturlparse"
pkgname=("python-giturlparse" "python2-giturlparse")
_pkgname='giturlparse.py'
pkgver=0.0.5
pkgrel=3
pkgdesc='Parse & rewrite git urls (supports GitHub, Bitbucket, Assembla ...)'
url='https://github.com/FriendCode/giturlparse.py'
arch=('any')
license=('Apache')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/FriendCode/giturlparse.py/archive/${pkgver}.tar.gz")
sha256sums=('91e398db31d295ba75b25b74a80835e2e24d6bdb818201aa58169833551745ca')

prepare() {
  cp -a ${_pkgname}-$pkgver{,-py2}
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_python-giturlparse() {
    depends=('python')
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-giturlparse() {
    depends=('python2')
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ft=sh ts=2 sw=2 et:
