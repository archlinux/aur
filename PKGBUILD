# Maintainer: aarto <aarto@archlinux.org>

_pkgname=librewolf-extension-tridactyl
pkgname=$_pkgname-bin
_id=tridactyl.vim@cmcaine.co.uk
pkgver=1.24.6
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
_number=4854935
source=("$_id-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/tridactyl_vim-$pkgver.xpi"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/tridactyl/tridactyl/refs/tags/$pkgver/LICENSE")
b2sums=('45bd1e16df48c1456831627725631eab1ff6ef8074ba6eecbb6818987664164706e7359ee264288e5a660526128a82cd03c0e9679c66f12c8164d70a41b2f262'
        '5b502323a8f7bb8e4d768c33e773c1092a2e45b5194fb274e542144298360266db7cbf1d5f67f23ee8d9207de7e289c2292bee1f5dd066202bbe20a1dc680c31')

package() {
  install -Dm644 "$_id-$pkgver.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
