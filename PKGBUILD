pkgname=iortcw-bin
pkgver=1.51c
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Open source engine for Return to Castle Wolfenstein"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/rtcw-bin"
license=('GPL')
depends=('sdl2' 'openal' 'zenity')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("$url/iortcw-binaries/$pkgver/-/raw/main/iortcw-linux-x64.tar.xz")
source_i686=("$url/iortcw-binaries/$pkgver/-/raw/main/iortcw-linux-i686.tar.xz")
source_aarch64=("$url/iortcw-binaries/$pkgver/-/raw/main/iortcw-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/iortcw"
    
    rm -rf  $srcdir/iortcw-*
    cp -R $srcdir/* $pkgdir/usr/share/games/iortcw/
   #Binaries
    find /usr/share/games/iortcw/ -name 'iowolfsp.*' -exec ln -sf {} "$pkgdir/usr/bin/iowolfsp" \;
    find /usr/share/games/iortcw/ -name 'iowolfmp.*' -exec ln -sf {} "$pkgdir/usr/bin/iowolfmp" \;
    find /usr/share/games/iortcw/ -name 'iowolfded.*' -exec ln -sf {} "$pkgdir/usr/bin/iowolfded" \;
}
