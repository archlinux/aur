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
source=("$_id.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0_$pkgver.firefox.xpi"
        "https://raw.githubusercontent.com/gorhill/uBlock/refs/tags/$pkgver/LICENSE.txt")
b2sums=('597f7a8393357659c14acc4b3af2346355d9f749b4bf7893ee331fc87a08cf52921611b7b459aacd07587b8aa090b83942aa495a424043ea0b9557d5e55819a1'
        '70878e15940b01e24866195829871711509ab49d8aca2ff7bac1d0fade060e409b10c348cc45f290f4d9c32105439fff847d571102ba6688d5b6aa02bd91bc42')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
