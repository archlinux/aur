# Maintainer: HLFH <gaspard@dhautefeuille.eu>

_pkgname=archey3
pkgname=${_pkgname}-git
pkgver=0.4.r57.gac68752
pkgrel=1
pkgdesc="Python script to display system information alongside the Arch Linux logo."
arch=('x86_64')
url="https://lclarkmichalek.github.io/archey3/"
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=(
'python-mpd2: python library for mpd interaction',
'python-logbook: for logging'
'imagemagick: for default screenshot command'
)
conflicts=('archey' 'archey3' 'archey4')
provides=('archey')
source=("git+https://github.com/bluepeppers/archey3.git")
b2sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

package() {
    cd "$_pkgname"
    python setup.py install --root=${pkgdir}
    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
}
