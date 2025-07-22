# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Kimiblock

_pkgname=librewolf-extension-ublock-origin
pkgname=$_pkgname-bin
_id=uBlock0@raymondhill.net
url="https://github.com/gorhill/uBlock"
pkgver=1.65.0
pkgrel=1
pkgdesc="uBlock Origin - An efficient blocker for LibreWolf. Fast and lean."
arch=('any')
license=('GPL-3.0-only')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("$_id.xpi")
source=("$_id.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0_$pkgver.firefox.signed.xpi"
        "https://raw.githubusercontent.com/gorhill/uBlock/refs/tags/$pkgver/LICENSE.txt")
b2sums=('0b04d8f347a3162d2da345206cbbb9b2f086a87db956a06108267392f9ca22e955a75396eabd021f7d59c330930d93e0f97d2a32c74ded460edcd4a81141e7d4'
        '70878e15940b01e24866195829871711509ab49d8aca2ff7bac1d0fade060e409b10c348cc45f290f4d9c32105439fff847d571102ba6688d5b6aa02bd91bc42')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
