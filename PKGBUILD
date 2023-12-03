# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: tee < teeaur at duck dot com >

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-3-4
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(x86_64)
url="https://quickhash-gui.org/"
license=(GPL2)
depends=(gtk2)
provides=(quickhash-gui)
conflicts=(quickhash-gui)
source=("${pkgname}-${pkgver}.zip::https://quickhash-gui.org/download/quickhash-v${_pkgver}-debian-packages-for-linux/?wpdmdl=2257")
sha256sums=('31491b5b04a199bf0d67c92421ed4aa53ac813240938b994a896da4fc1295334')

package() {
  cd "$srcdir/PreCompiledBinary"
  install -Dm755 Quickhash-GUI -t "${pkgdir}/usr/bin"
  install -D libs/x64/libewf-Linux-x64.so -t "${pkgdir}/usr/lib"
  install -Dm644 ../UserManual.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
