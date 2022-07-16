# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
# Maintainer: Enes Baytekin <enesbaytekin38@gmail.com>
pkgbase=sudo-mice-bin
pkgname=sudo-mice-bin
pkgver=1.0
pkgrel=1
pkgdesc="A pixel graphics CLI GUI two players game."
arch=('x86_64')
url="https://github.com/Elagoht/SudoMice"
license=('Unlicense')
provides=("sudo-mice")
source=("SudoMice.tar.gz::https://github.com/Elagoht/SudoMice/releases/download/v$pkgver/SudoMice.tar.gz")
sha256sums=('3469fbf2bd86780937efc56d41114baed9b1c2a7775e8e756695445d5629754c')
pkgver() {
  printf "$pkgver"
}
package() {
  rm -v install.sh
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "SudoMice.desktop" -t "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/sudomice"
  chmod +x SudoMice
  mv -v "assets" "$pkgdir/usr/share/sudomice/"
  install -Dm755 "SudoMice" "$pkgdir/usr/share/sudomice"
  rm -v *
}
