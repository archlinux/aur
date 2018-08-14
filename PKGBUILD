# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-0-2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(i686 x86_64)
url="https://quickhash-gui.org/"
license=(GPL2)
depends=(gtk2)
provides=(quickhash-gui)
conflicts=(quickhash-gui quickhash-gui-bin)
source=("quickhash-gui-${pkgver}.zip::https://quickhash-gui.org/download/quickhash-v3-0-2-debian-packages-for-linux/?wpdmdl=1658")
md5sums=('96fb68e77aaac9c91e5943a1463c52c8')

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf ${_pkgname}_${pkgver}-1_amd64.deb
    fi

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
