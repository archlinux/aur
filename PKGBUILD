# Maintainer: Filth <filth [at] wagn [dot] me>

# The fox flux DELUXE Patreon build must be downloaded from:
# https://www.patreon.com/posts/4-fox-flux-build-137828032
# and placed in the same directory as this PKGBUILD.

_pkgname="fox-flux-deluxe"
_build_date=20250831
pkgname="$_pkgname-patreon"
pkgver=0.11.$_build_date
pkgrel=1
pkgdesc="fox flux DELUXE is a puzzle-platformer about being a little cartoon fox who turns into things rather easily. (Patreon subscriber release)"
arch=('any')
options=("!debug")
url="https://eevee.itch.io/fox-flux-deluxe"
license=('custom')
depends=('love')
conflicts=('fox-flux-deluxe-demo')
source=("$_pkgname.desktop"
        "$_pkgname.sh"
        "file://$_pkgname-$_build_date.love")
b2sums=('40bb21737f5522126d0d1ae7e82b3354c0e44cdb598bb44e89cde76e88f61383a45d27119bf2f150ce390ce5663bbeba1eccb74dbb7c7de6f5a1208e54eafc32'
        '058303c5a8e8558bf0fc285d7985d9a9dd7c480aa25b52d69400981bb53ad94156d8ce4be4e75b3772f627ba8cb7571f4955254543a03067a69d6091ca8a3240'
        'e05e26c193fa0a533bcdfe417c157fc1657e3e83a72b38515890633e36e9359f16a439393b8418d0868445fd9a7c06202779455f881230c7be05a2df4db2903a')

package() {
  # Install Data
  install -Dm755 "$_pkgname-$_build_date.love" "$pkgdir/usr/share/$_pkgname/$_pkgname.love"

  # Install Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}