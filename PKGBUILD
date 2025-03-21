# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Kimiblock

_pkgname=librewolf-extension-ublock-origin
pkgname=$_pkgname-bin
_id=uBlock0@raymondhill.net
url="https://github.com/gorhill/uBlock"
pkgver=1.63.2
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
b2sums=('43c4e4b2a492eccaa0a6c1387dbe547df64975b435533e7bae7cd28019a851d1efe0fb7d1bca6a6d6b424b98d078596c2e30e92591137c746f3c155e596475cb'
        '70878e15940b01e24866195829871711509ab49d8aca2ff7bac1d0fade060e409b10c348cc45f290f4d9c32105439fff847d571102ba6688d5b6aa02bd91bc42')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
