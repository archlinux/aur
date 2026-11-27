# Maintainer: Akusen <akudesyn@gmail.com>
pkgname=floema
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal emulator for Linux where every command is a living capsule, a Genoma app in Bioma's style"
arch=('any')
url="https://github.com/AkusenArcade/Floema"
license=('MIT' 'OFL-1.1')
# genoma runs the pty, the emulation and the grid; Space Mono, the grid's
# font, comes with it (no package names it "Space Mono").
depends=('genoma>=0.1.26' 'hicolor-icon-theme' 'fontconfig')
optdepends=('xdg-terminal-exec: Floema as the desktop'"'"'s terminal, switched in its settings'
            'libnotify: commands that end unseen, told')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('885365af36419cf851e8ad347f285b099173fce91d0872d6748b8c64be00a10e')

package() {
  cd "Floema-$pkgver"
  install -dm755 "$pkgdir/usr/share/floema"
  cp -r genoma/. "$pkgdir/usr/share/floema/"
  install -Dm755 floema                       "$pkgdir/usr/bin/floema"
  install -Dm644 dev.akusen.floema.desktop    "$pkgdir/usr/share/applications/dev.akusen.floema.desktop"
  install -Dm644 assets/floema.svg            "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.akusen.floema.svg"
  install -Dm644 -t "$pkgdir/usr/share/fonts/floema" assets/fonts/*.ttf
  install -Dm644 LICENSE                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/fonts/OFL.txt         "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
