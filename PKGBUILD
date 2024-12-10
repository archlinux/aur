# Maintainer: aarto <aarto@archlinux.org>

_pkgname=librewolf-extension-tridactyl
pkgname=$_pkgname-bin
_id=tridactyl.vim@cmcaine.co.uk
pkgver=1.24.1
pkgrel=1
pkgdesc="Replace Librewolf's control mechanism with one modelled on Vim."
url=https://tridactyl.xyz/
arch=('any')
license=('Apache-2.0')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("tridactyl-$pkgver.xpi")
_number=4261352
source=("$_id.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/tridactyl_vim-$pkgver.xpi"
        "https://raw.githubusercontent.com/tridactyl/tridactyl/refs/tags/$pkgver/LICENSE")
b2sums=('d1690a43158f9304c1ba1a3d1addd6ea10f73380813ac70c8ff72ec083c613c9c5dccd57577eba86933c047534758cd82671d8562b8ce4d8effcee754ed29852'
        '5b502323a8f7bb8e4d768c33e773c1092a2e45b5194fb274e542144298360266db7cbf1d5f67f23ee8d9207de7e289c2292bee1f5dd066202bbe20a1dc680c31')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
