# Maintainer: aarto <aarto@archlinux.org>

_pkgname=librewolf-extension-tridactyl
pkgname=$_pkgname-bin
_id=tridactyl.vim@cmcaine.co.uk
pkgver=1.24.4
pkgrel=1
pkgdesc="Replace LibreWolf's control mechanism with one modelled on Vim."
url=https://tridactyl.xyz/
arch=('any')
license=('Apache-2.0')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("$_id.xpi")
_number=4549492
source=("$_id.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/tridactyl_vim-$pkgver.xpi"
        "https://raw.githubusercontent.com/tridactyl/tridactyl/refs/tags/$pkgver/LICENSE")
b2sums=('2e16ca90100d7289aa2cfa6cce258eaa3eefa36c0d6435fe2f00bf050215a1ce7c2f62f0c301311734adaac862f6b24edc43797c7ff9366a244802a7c3ed714e'
        '5b502323a8f7bb8e4d768c33e773c1092a2e45b5194fb274e542144298360266db7cbf1d5f67f23ee8d9207de7e289c2292bee1f5dd066202bbe20a1dc680c31')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
