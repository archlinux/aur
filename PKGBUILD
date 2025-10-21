# Maintainer: Juliette Cordor <me@cordor.dev>
pkgname=savestate-bin
pkgver=1.4.6c
pkgrel=1
epoch=
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64')
url="https://github.com/Matteo842/SaveState"
license=('GPL-3.0-only')
groups=()
depends=('glibc' 'zlib')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=(savestate)
conflicts=(savestate)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname-$pkgver.zip::https://github.com/Matteo842/SaveState/releases/download/$pkgver/SaveState-$pkgver-Linux.zip"
  "SaveState.png::https://github.com/Matteo842/SaveState/blob/$pkgver/icon.png?raw=true"
)
noextract=()
sha256sums=(
  'f74642a5cd722497f6855fca2113c4d7f6b3bad77d9f37effb07ecafcf0a3b20'
  '7f7b294aa10ef51f23dbccd814e2ce507269be889e444f2bf2b1fb5c50dcb15e'
)
validpgpkeys=()
_name="SaveState"
_categories=('Game;Utility')
_exec="/usr/bin/SaveState"

prepare() {
  cd "$srcdir"

  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" \
    --categories=$_categories \
    --name=$_name \
    --genericname=$_name \
    --exec=$_exec \
    --icon=$_name

}

package() {
  cd "$srcdir"

  install -Dm0755 -t "$pkgdir/usr/share/applications/" "savestate.desktop"
  install -Dm0755 -t "$pkgdir/usr/share/icons/" "$_name.png"

  install -Dm0755 -t "$pkgdir/usr/bin" "SaveState"
}
