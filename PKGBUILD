# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
_pgmname=vuescan
_srcname=VueScan
pkgver=9.5
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=('i686' 'x86_64')
url="http://www.hamrick.com/"
license=('custom')
depends=('gtk2' 'libsm' 'libusb-compat')
# Following required to accept registration details
options=(!strip)
source=(LICENSE vuescan.sh vuescan.desktop)
md5sums=('e4d56c48bc5ac80b83630238a7ab658d'
         'da269332a033a101a4509d34f1552c10'
         '30e56e810df66e0d8425563903bcfa83')
[ "${CARCH}" == 'i686'   ] && source+=(http://www.hamrick.com/files/vuex3295.tgz)
[ "${CARCH}" == 'x86_64' ] && source+=(http://www.hamrick.com/files/vuex6495.tgz)
md5sums+=('SKIP')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/$_pgmname"
  cp -rp "$_srcname"/* "$pkgdir/opt/$_pgmname/"
  install -Dm755 "$srcdir/$_pgmname.sh" "$pkgdir/usr/bin/$_pgmname"
  install -Dm644 "$srcdir/$_pgmname.desktop" "$pkgdir/usr/share/applications/$_pgmname.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pgmname/LICENSE"
}
