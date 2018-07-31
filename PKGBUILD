# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=python-duckling
pkgbase=python-duckling
pkgname=('python-duckling' 'python2-duckling')
pkgdesc="Python wrapper for wit.ai's Duckling Clojure library"
pkgver=1.8.0
pkgrel=1
url="https://github.com/FraBle/python-duckling"
license=('APACHE')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/FraBle/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9aa59d55cd546b977d86987c68676d3ed38d2a902d74bd67960c23e5f8d4a41e893f3ef495d15862a9b18cc839a1fce07f490caa96c5a3f6a86ffcf4e69f27fa')
#validpgpkeys=('') # TODO

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-duckling() {
    depends=('python' 'java-environment' 'python-jpype1')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-duckling() {
    depends=('python2' 'java-environment' 'python2-jpype1')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
