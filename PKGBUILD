# Contributor: Steff <archuserrepository at gmx dot de>
# Contributor: Felix <flx.bier at googlemail dot com>

pkgname=dudenbib
pkgver=6.5.2
pkgrel=2
arch=('x86_64')
pkgdesc="Utility to view books from Duden, Brockhaus and some others"
url="https://www.duden.de/digitales/duden-bibliothek"
license=('custom:dudenbib')
install=duden.install
depends=('libxmu' 'libxft' 'libxcursor' 'libxrandr' 'gcc-libs' 'libxi' 'libxinerama' 'libxcb' 'xcb-util-cursor')
FILE="dudenbibliothek6_6.5.2.0_amd64.deb"
source=("https://cdn.duden.de/downloads/proxy/duden_bibliothek-update-6.5/$FILE")
noextract=("$FILE")
md5sums=('0086cb9b3e39c40fcb858b542af5a3d4')
package() {
  ar -x $FILE data.tar.zst control.tar.zst
  tar -xf data.tar.zst -C "$pkgdir"
  tar -xf control.tar.zst

  chmod -R 755 "${pkgdir}/opt"
  chmod -R 755 "${pkgdir}/usr"

  install -Dm755 "${srcdir}/postinst" "${pkgdir}/usr/share/dudenbib/postinst"
}

