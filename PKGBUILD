pkgname=iortcw-bin
pkgver=1.51c
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Open source engine for Return to Castle Wolfenstein"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/linuxbombay/iortcw"
license=('GPL')
depends=('sdl2' 'openal' 'zenity')
makedepends=('unzip')
sha256sums_x86_64=('659f8a52e59ad57156073c6797d77e067a8004966c5cbf179557c326f31a0b6d')
sha256sums_i686=('2f164cf9f0690be1bc798dd5028c3ccc9a6461fd0b95f8be306485e85bd3fa34')
sha256sums_aarch64=('30ea0430d0fc81ad524e5f1956f4a040f6e3242e96b65a743a5a40877e532b48')
source_x86_64=("$url/$pkgver/-/raw/main/iortcw-linux-x64.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/iortcw-linux-i686.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/iortcw-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/iortcw"
    
    rm -rf  $srcdir/iortcw-*
    cp -r "$srcdir"/* "$pkgdir/usr/share/games/iortcw/"
   #Binaries
#iowolf Single Player Binary
for file in "$pkgdir/usr/share/games/iortcw"/iowolfsp.*; do
  filename=$(basename "$file")
  ln -sf "/usr/share/games/iortcw/$filename" "$pkgdir/usr/bin/iowolfsp"
done

#iowolf Multiplayer Binary
for file in "$pkgdir/usr/share/games/iortcw"/iowolfmp.*; do
  filename=$(basename "$file")
  ln -sf "/usr/share/games/iortcw/$filename" "$pkgdir/usr/bin/iowolfmp"
done

#iowolf dedicated Binary 
for file in "$pkgdir/usr/share/games/iortcw"/iowolfded.*; do
  filename=$(basename "$file")
  ln -sf "/usr/share/games/iortcw/$filename" "$pkgdir/usr/bin/iowolfded"
done
}
