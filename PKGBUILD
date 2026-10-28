pkgname=zeldaladxhd-bin
pkgver=v2.0.9
pkgrel=1
scriptver=1.0.2.1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Open source and unofficial Links Awakening DX HD PC port"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/bighead.0/ladxhd_updated"
depends=('zenity' 'yad' 'git' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'openal' 'libgl')
options=('!strip')
license=('GPL')
makedepends=('unzip')
sha256sums=('6969cafeb166010d974314ee8ad6491ab111794a189a670d7963644d7ca4d53a')
sha256sums_x86_64=('ab9db80313aa0801a06ccf310a2586ab1f6e2fad41793936487b4626ce217b15')
sha256sums_aarch64=('778c72c6587c448955f12a2fd03fc8becc3a2c19020dc5bde84f7a43b7cf763c')
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
