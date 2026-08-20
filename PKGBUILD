pkgname=zeldaladxhd-bin
pkgver=v2.0.4
pkgrel=2
scriptver=1.0.2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Open source and unofficial Links Awakening DX HD PC port"
arch=('x86_64' 'aarch64')
url="https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated"
depends=('zenity' 'yad' 'git' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'openal' 'libgl')
options=('!strip')
license=('GPL')
makedepends=('unzip')
sha256sums=('8675d46a4b72ea4ebe2daee07eaa76fc4b2e2856a8b98c43202dfb928894cb58')
sha256sums_x86_64=('5aa81b61cb822faa91d09cb6348283cefb0dc376902b9fdd7fce93c6bb6c4d4d')
sha256sums_aarch64=('5985ebda47fde88ed72bd95c7b6c605785c8a15a6f825d40de3d4b2b6fd665c6')
source=("https://gitlab.com/linuxbombay/zeldaladxhd/zeldaladxhd/-/archive/$scriptver/zeldaladxhd-$scriptver.tar.bz2")
source_x86_64=("https://gitlab.com/linuxbombay/zeldaladxhd/binaries/$pkgver/-/raw/main/LADXHD.Patcher.$pkgver-Linux-x64.7z")
source_aarch64=("https://gitlab.com/linuxbombay/zeldaladxhd/binaries/$pkgver/-/raw/main/LADXHD.Patcher.$pkgver-Linux-arm64.7z")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/games/Zeldaladxhd"
   install -dm755 "$pkgdir/usr/share/applications"
   install -dm755 "$pkgdir/usr/share/pixmaps"

   install -Dm755 "$srcdir"/LADXHD.Patcher."$pkgver"-Linux-*/LADXHD-Patcher.bin "$pkgdir/usr/share/games/Zeldaladxhd/patcher"
   install -Dm755 "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd" "$pkgdir/usr/bin"
   echo "$pkgver" > "$pkgdir/usr/share/games/Zeldaladxhd/version.txt"
   cp -r "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd.svg" "$pkgdir/usr/share/pixmaps"
   install -Dm755 "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd.desktop" "$pkgdir/usr/share/applications"
}
