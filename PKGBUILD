# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-2-0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(i686 x86_64)
url="https://quickhash-gui.org/"
license=(GPL2)
depends=(gtk2)
provides=(quickhash-gui)
conflicts=(quickhash-gui)
source=("quickhash-gui-${pkgver}.zip::https://quickhash-gui.org/download/quickhash-v${_pkgver}-debian-packages-for-linux/?wpdmdl=2025")
sha256sums=('bf1c6e4d8e273a81381bfadf96d0746d7e65f5cc77757df92e88533eaa6d72c6')

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_amd64.deb
    fi

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
