# Maintainer: Timothy Redaelli <tredaelli@archlinux.org>

_pkgname=melis-wallet
pkgname=$_pkgname-bin
pkgver=1.5.40
pkgrel=1
pkgdesc="The most advanced wallet for Bitcoin, Bitcoin Cash, Litecoin and Groestlcoin."
arch=('x86_64')
url="https://www.melis.io/"
license=('custom')
options=(!strip)
depends=('alsa-lib' 'libxss' 'libxtst' 'gconf' 'gtk2' 'nss')
source=("https://www.melis.io/pakages/linux/production/MelisWallet-linux-x64-$pkgver.zip")
sha256sums=('3bac88a9a7f7f4a45198b106d2b09c96834900fa9fd78dc9dd6a028dd09f41a2')

package() {
  install -dm755 "$pkgdir"/usr/lib/melis-wallet/
  install -dm755 "$pkgdir"/usr/bin/
  cp -a MelisWallet-linux-x64/* "$pkgdir"/usr/lib/melis-wallet/
  ln -s ../lib/melis-wallet/melis-wallet "$pkgdir"/usr/bin
  install -Dm644 $srcdir/MelisWallet-linux-x64/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}

# vim:set ts=2 sw=2 et:
