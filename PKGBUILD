# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname="fox-flux-deluxe"
pkgname="$_pkgname-demo"
pkgver=0.10.1
pkgrel=2
pkgdesc="fox flux DELUXE is a puzzle-platformer about being a little cartoon fox who turns into things rather easily. (itch.io demo)"
arch=('any')
options=("!debug")
url="https://eevee.itch.io/fox-flux-deluxe"
license=('custom')
depends=('love')
makedepends=('itchio-dlagent')
conflicts=('fox-flux-deluxe-patreon')
source=("$_pkgname.desktop"
        "$_pkgname.sh"
        "$_pkgname-$pkgver.love::itch://eevee/fox-flux-deluxe/7262953")
b2sums=('c0ba6f08d4ef25b280d3dc622c5c3d299e46fb0e8e9542374b0c6f18ae352237cc095d9d5d5c5625006f146aa4bab5d35ef92f475e4e04909867967fea3462cd'
        '058303c5a8e8558bf0fc285d7985d9a9dd7c480aa25b52d69400981bb53ad94156d8ce4be4e75b3772f627ba8cb7571f4955254543a03067a69d6091ca8a3240'
        '596132db4a82bba3434ce069f82de228bff84a26d58f46a1936bf3fb76ba6e2a14feecaec4222f874eb82871b4ae6378e00ccfa1cba093fc79ff867d288fdc8e')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
  # Install Data
  install -Dm755 "$_pkgname-$pkgver.love" "$pkgdir/usr/share/$_pkgname/$_pkgname.love"

  # Install Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}