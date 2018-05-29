# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

_pkgname=pyzfscmds
pkgname="python-${_pkgname}"
pkgver=0.1.0
_version_suffix="alpha"
pkgrel=1
pkgdesc="ZFS CLI Function Wrapper"
arch=('any')
url="http://github.com/johnramsden/pyzfscmds"
license=('BSD' 'custom:BSD 3 clause')
depends=('zfs-linux' 'python' 'python-setuptools')
makedepends=('git' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${_pkgname}/archive/v${pkgver}-${_version_suffix}.tar.gz")
md5sums=('ef47bc6d8c3b226c915e01c251fe251e')
conflicts=('python-pyzfscmds-git')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}-${_version_suffix}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}-${_version_suffix}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

   	install -d "${pkgdir}/usr/share/license/${pkgname}"
	install -m 755 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LISCENSE"
}
