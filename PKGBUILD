# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=qhue
pkgbase=python-qhue
pkgname=('python-qhue' 'python2-qhue')
pkgdesc="A very lightweight Python wrapper to the Philips Hue API"
pkgver=1.0.9
pkgrel=1
arch=('any')
url="https://github.com/quentinsf/qhue"
license=('GPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quentinsf/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c037fa12c38b05e2569a16450c6bf361d5e3615f27ab3a79141779287429e5914d4501f86c62e91b40812fcb532628e2eae568e4e1b928a74a56d37e55e5887f')
validpgpkeys=('') # TODO

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-qhue() {
    depends=('python' 'python-requests')
    optdepends=('python-yaml: debug print API responses')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-qhue() {
    depends=('python2' 'python2-requests')
    optdepends=('python2-yaml: debug print API responses')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
