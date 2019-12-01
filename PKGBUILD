# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zedenv-grub
pkgver=0.1.8
_version_suffix="alpha"
pkgrel=1
pkgdesc="zedenv plugin for GRUB (ALPHA)"
arch=('any')
url="http://github.com/johnramsden/zedenv-grub"
license=('BSD' 'custom:BSD 3 clause')
depends=('zfs' 'python' 'python-setuptools' 'python-click' 'python-pyzfscmds' 'zedenv')
makedepends=('git' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}-${_version_suffix}.tar.gz")
md5sums=('2da64b90f04a903b088519c638d23f23')
conflicts=('zedenv-grub-git')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_version_suffix}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -d "${pkgdir}/usr/share/license/${pkgname}"
    install -m 755 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
