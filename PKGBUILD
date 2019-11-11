# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-1-0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(i686 x86_64)
url="https://quickhash-gui.org/"
license=(GPL2)
depends=(gtk2)
provides=(quickhash-gui)
conflicts=(quickhash-gui)
source=("quickhash-gui-${pkgver}.zip::https://quickhash-gui.org/download/quickhash-v${_pkgver}-debian-packages-for-linux/?wpdmdl=1953")
sha256sums=('f47a85f3af58b5e053af8998a041353ebd87cbaf06a3fb42d83f7899e4ff1fd7')

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_amd64.deb
    fi

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
