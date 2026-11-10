# Maintainer: CPT Dawn <ping@cptdawn.dev>
pkgname=nexus-nm-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A network manager for Wayland desktops: a user daemon and a TUI over NetworkManager (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/CPT-Dawn/Nexus'
license=('MIT')
depends=('glibc' 'gcc-libs' 'networkmanager')
optdepends=('polkit: authorise Wi-Fi and Profile changes (see /usr/share/doc/nexus/POLKIT.md)'
            'iw: count the stations joined to a Hotspot'
            'xdg-utils: open a Portal login page in the browser (xdg-open)'
            'xdg-terminal-exec: open a terminal from notification actions (else $TERMINAL is used)')
provides=('nexus' "nexus-nm=$pkgver")
conflicts=('nexus' 'nexus-nm')
source_x86_64=("nexus-$pkgver-x86_64.tar.gz::https://github.com/CPT-Dawn/Nexus/releases/download/v$pkgver/nexus-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("nexus-$pkgver-aarch64.tar.gz::https://github.com/CPT-Dawn/Nexus/releases/download/v$pkgver/nexus-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('6154f0f4b0b5d90c84e8fb2c1d3f82df59158ca73baae8f318cbdb8a4c8f09d4')
sha256sums_aarch64=('4f9d76dcf3fed84196142a9af91088117e57c899773fa22181d2afa100b88846')

package() {
  cd "nexus-$pkgver-$CARCH-linux"
  cp -a usr "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/nexus/README.md"
  install -Dm644 POLKIT.md "$pkgdir/usr/share/doc/nexus/POLKIT.md"
}
