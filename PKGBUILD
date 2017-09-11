# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname=quickhash
pkgver=2.8.4
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=('i686' 'x86_64')
url="http://quickhash-gui.org/"
license=('GPL2')
depends=('gtk2')
provides=('quickhash-gui')
conflicts=('quickhash-gui' 'quickhash-gui-bin')
source=("https://sourceforge.net/projects/lolix-remix-of-manjaro/files/AUR_pkg/mirror/${_pkgname}-$pkgver-debian.zip")
md5sums=('bd01e2e70218cf25bcf2536e84ae65f5')
package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_amd64.deb
    fi
bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
