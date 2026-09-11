# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Kimiblock

_pkgname=librewolf-extension-ublock-origin
pkgname=$_pkgname-bin
_id=uBlock0@raymondhill.net
url="https://github.com/gorhill/uBlock"
pkgver=1.74.0
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
b2sums=('a174513d9f22f839b9e01919169645cb81b96b8376709acc12127b8d1ef007c8b5de069a0f7105278b2bcbc27e44edf6660f74a533c3226ce0ccec95185b420f'
        '70878e15940b01e24866195829871711509ab49d8aca2ff7bac1d0fade060e409b10c348cc45f290f4d9c32105439fff847d571102ba6688d5b6aa02bd91bc42')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
