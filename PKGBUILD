# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zedenv
pkgver=0.1.1
_version_suffix="alpha"
pkgrel=1
pkgdesc="Utility to manage Boot Environments using ZFS"
arch=('any')
url="http://github.com/johnramsden/zedenv"
license=('BSD' 'custom:BSD 3 clause')
depends=('zfs-linux' 'python' 'python-setuptools' 'python-click' 'python-pyzfscmds')
makedepends=('git' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}-${_version_suffix}.tar.gz")
md5sums=('ac8c98c5fa5d7bc1e057591d7982ee46')
conflicts=('zedenv-git')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

   	install -d "${pkgdir}/usr/share/license/${pkgname}"
	install -m 755 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LISCENSE"
}
