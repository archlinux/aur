# Maintainer: Electrux <ElectruxRedsworth AT gmail DOT com>

pkgname=dr
pkgver=2.0
pkgrel=1
pkgdesc="An ed-like client for devRant written in python"
arch=('any')
url="https://github.com/Ewpratten/dr"
license=('MIT')

makedepends=('python-pip' 'python')
depends=('python-pip' 'python')

source=("https://github.com/Ewpratten/${pkgname}/releases/download/${pkgver}-nix/dr")
sha512sums=('b372238a0ee3ce0a44ca733c0f9676f9f21498304825ee97409351c78f9fbd08ae44c2f354ecfbb030b5c59eebee85227f643ff6d2063622759f82bd60e6f377')

package() {
        PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" requests devRantSimple
        install -Dm755 ./dr "${pkgdir}/usr/bin/dr"
}

