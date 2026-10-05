# Maintainer: QiE2035 <qie2035@qq.com>
pkgname=filmcraft-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Video editor: edit video, color and sound — a clean-room Premiere-style editor in Rust (official binary)"
arch=('x86_64')
url="https://getartcraft.com/apps/filmcraft"
license=('MIT' 'Apache-2.0')
depends=(
  'alsa-lib'
  'dbus'
  'gcc-libs'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
)
provides=('filmcraft')
conflicts=('filmcraft')
options=('!strip')
source=("https://github.com/storytold/filmcraft/releases/download/v$pkgver/filmcraft-$pkgver-linux-x86_64.tar.gz")
sha256sums=('35743d048fcd942a1fe36b8c95f0af7b3ce7d5577325afabfae1083175d22fa5')

package() {
  cd "filmcraft-$pkgver-linux-x86_64"

  install -Dm755 bin/filmcraft -t "$pkgdir/usr/bin/"
  install -Dm755 bin/filmcraft-cli -t "$pkgdir/usr/bin/"

  install -d "$pkgdir/usr/share"
  cp -a share/applications share/icons share/metainfo share/mime -t "$pkgdir/usr/share/"

  install -Dm644 share/doc/filmcraft/LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 share/doc/filmcraft/LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 share/doc/filmcraft/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
