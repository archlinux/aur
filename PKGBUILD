# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=qhue
pkgbase=python-qhue
pkgname=('python-qhue' 'python2-qhue')
pkgdesc="A very lightweight Python wrapper to the Philips Hue API"
pkgver=1.0.8
pkgrel=1
arch=('any')
url="https://github.com/quentinsf/qhue"
license=('GPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quentinsf/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('98158acef3134f0909fdb72ec80d3af3714ac72cec8171588c842871b7fc049deaaa37bcd6c68eaddd0db6807bf004aeeec4969ccae3fab1a1290717f26e7a56')
validpgpkeys=('') # TODO

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-qhue() {
    depends=('python' 'python-requests')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-qhue() {
    depends=('python2' 'python2-requests')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
