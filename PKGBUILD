# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
# Maintainer: Enes Baytekin <enesbaytekin38@gmail.com>
pkgbase=sudo-mice-bin
pkgname=sudo-mice-bin
pkgver=1.0
pkgrel=3
pkgdesc="A pixel graphics CLI GUI two players game."
arch=('x86_64')
url="https://github.com/Elagoht/SudoMice"
license=('Unlicense')
provides=("sudo-mice")
source=("SudoMice.tar.gz::https://github.com/Elagoht/SudoMice/releases/download/v$pkgver/SudoMice.tar.gz")
sha256sums=('cc04350147e691342d8d312cb35ffc2c76b78fc53a0e2e70af1703f991c18ecd')
depends=('glu')
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
  install -d "$pkgdir/usr/bin"
  ln -sv "/usr/share/sudomice/SudoMice" "$pkgdir/usr/bin/sudo-mice"
  rm -v *
}
