# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-3-0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(x86_64)
url="https://quickhash-gui.org/"
license=(GPL2)
depends=(gtk2)
provides=(quickhash-gui)
conflicts=(quickhash-gui)
source=("${pkgname}-${pkgver}.zip::https://quickhash-gui.org/download/quickhash-v${_pkgver}-debian-packages-for-linux/?wpdmdl=2166")
sha256sums=('7e42bb8deca3d1c3e5cfa23b76c0015745b67e27c3e3f7d5cb3fbbfa61b44579')

package() {
  install -Dm755 Quickhash-GUI -t "${pkgdir}/usr/bin"
  install -D libs/x64/libewf-Linux-x64.so -t "${pkgdir}/usr/lib"
  install -Dm644 UserManual.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
