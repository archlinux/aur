# Maintainer: aarto <aarto@archlinux.org>

_pkgname=librewolf-extension-tridactyl
pkgname=$_pkgname-bin
_id=tridactyl.vim@cmcaine.co.uk
pkgver=1.25.1
pkgrel=1
pkgdesc="Replace LibreWolf's control mechanism with one modelled on Vim."
url=https://tridactyl.xyz/
arch=('any')
license=('Apache-2.0')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("$_id-$pkgver.xpi")
_number=5014416
source=("$_id-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/tridactyl_vim-$pkgver.xpi"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/tridactyl/tridactyl/refs/tags/$pkgver/LICENSE")
b2sums=('91da828f9f589754e0a6d32c8874c79cc16f50d5190b004932fa9e59f3bc887bb6c96397892530256896e1d440414f4c0aa335dcf8f7a778bcfd88926a9a3e11'
        '5b502323a8f7bb8e4d768c33e773c1092a2e45b5194fb274e542144298360266db7cbf1d5f67f23ee8d9207de7e289c2292bee1f5dd066202bbe20a1dc680c31')

package() {
  install -Dm644 "$_id-$pkgver.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
