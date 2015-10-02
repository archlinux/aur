# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('pip2pkgbuild')
pkgname=('pip2pkgbuild' 'python2-pip2pkgbuild')
_module='pip2pkgbuild'
pkgver='0.1.4'
pkgrel=2
pkgdesc="Generate PKGBUILD file for a Python module from PyPi"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pip2pkgbuild/pip2pkgbuild-${pkgver}.tar.gz")
md5sums=('83e008cd984821d7ac925b4ac95421f7')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

package_pip2pkgbuild() {
    depends+=('python' 'python-setuptools')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pip2pkgbuild() {
    depends+=('python2' 'python2-setuptools')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/pip2pkgbuild"{,2}
}

