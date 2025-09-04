# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: tee < teeaur at duck dot com >

pkgname=quickhash-gui-bin
_pkgname=quickhash
_pkgver=3-3-4
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=(x86_64)
url="https://quickhash-gui.org"
license=(GPL-2.0-only)
makedepends=(gendesk)
depends=(gtk2 libewf)
provides=(quickhash-gui)
conflicts=(quickhash-gui)
source=("$pkgname-$pkgver.zip::$url/download/?wpdmdl=2508")
sha256sums=('4af1548f384a4245f1c0630808958264a0b482edd9c7eec140616cfbe9dcc1e9')

prepare() {
  gendesk -n Quickhash-GUI
}

package() {
  install -Dm644 Quickhash-GUI.desktop -t "${pkgdir}/usr/share/applications"
  cd "$srcdir/Binary-x64"
  install -Dm755 Quickhash-GUI -t "${pkgdir}/usr/bin"
  install -Dm644 ../UserManual.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
