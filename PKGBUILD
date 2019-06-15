# Maintainer: Matthijs Tadema <M dot J dot Tadema dot protonmail dot com>
pkgname=python-pycg_bonds
_pkgname=pycg_bonds
pkgver=0.2
_release="alpha"
pkgrel=1
pkgdesc="Render coarse grained molecular structures in PyMOL"
arch=('any')
url="https://github.com/mjtadema/pycg_bonds/"
license=('MIT')
depends=('python>=3'
         'pymol>=2')
source=("${_pkgname}-${pkgver}-${_release}.tar.gz::https://github.com/mjtadema/pycg_bonds/archive/v${pkgver}-${_release}.tar.gz"
        "https://github.com/mjtadema/pycg_bonds/releases/download/v${pkgver}-${_release}/${_pkgname}-${pkgver}-${_release}.tar.gz.sig")
md5sums=("SKIP"
         "SKIP")
validpgpkeys=("7101E1F6DFB5E1408C551AB1D66124EB8F2BB7B7")

prepare() {
        bsdtar -xvf ${_pkgname}-${pkgver}-${_release}.tar.gz
}
package() {
	mkdir -p $pkgdir/$HOME/.pymol
        install -m755 ${_pkgname}-${pkgver}-${_release}/pycg_bonds.py $pkgdir/$HOME/.pymol
}
