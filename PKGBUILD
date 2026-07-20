# Maintainer: kurumihere <kurumihere@disroot.org>

pkgname=mp-player-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='music player'
arch=('x86_64')
url='https://github.com/kurumihere/mp'
license=('MIT')
depends=(
  'alsa-lib'
  'desktop-file-utils'
  'freetype2'
  'glib2'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxrandr'
)
optdepends=(
  'kdialog: file and folder dialogs on KDE Plasma'
  'yad: alternative GTK file and folder dialogs'
  'zenity: file and folder dialogs on GTK desktops'
)
provides=("mp-player=$pkgver")
conflicts=('mp' 'mp-player' 'mp-player-git')
source=(
  'mp-player.desktop'
  "mp-$pkgver-icon.png::https://raw.githubusercontent.com/kurumihere/mp/v$pkgver/assets/icon.png"
)
source_x86_64=(
  "mp-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/mp-$pkgver-linux-x86_64.tar.gz"
)
sha256sums=(
  '3fc25e2c0284de96df98f979f5c1445cb8ae3024592db54002a5cc9d9c46a479'
  '99095c6acf4643928a7acb1417629b56925822c5a56a74e5184bc8660655a220'
)
sha256sums_x86_64=(
  'dc7bd695bfa80b866c5aa12d94157864a76b965022073ed7058644791a163c3e'
)

package() {
  cd "mp-$pkgver-linux-x86_64"

  install -Dm755 mp "$pkgdir/usr/bin/mp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 OFL-*.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/mp-player.desktop" \
    "$pkgdir/usr/share/applications/mp-player.desktop"
  install -Dm644 "$srcdir/mp-$pkgver-icon.png" \
    "$pkgdir/usr/share/pixmaps/mp.png"
}
