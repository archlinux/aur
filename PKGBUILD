# Maintainer: Christian Helle <christian.helle@outlook.com>
pkgname=httprunner-bin
pkgver=1.2.55
pkgrel=1
pkgdesc="Execute HTTP requests from .http files (CLI, TUI and GUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/christianhelle/httprunner"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
optdepends=(
  'libxkbcommon: required by httprunner-gui'
  'wayland: httprunner-gui on Wayland'
  'libx11: httprunner-gui on X11'
  'libglvnd: OpenGL rendering for httprunner-gui'
)
provides=('httprunner')
conflicts=('httprunner')
options=('!strip' '!debug')
source=("httprunner-gui.desktop"
        "httprunner-gui-$pkgver.png::https://raw.githubusercontent.com/christianhelle/httprunner/$pkgver/images/httprunner.iconset/icon_512x512.png")
sha256sums=('630c69eed75b0ac17c11789ae1f629c496bcfa0e79fea5aad6b88cf48377bfca'
            '69fd85750e8a2fa67d7ae8f5bbc663c4382557363ea06cae640a53472e4d342b')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/httprunner-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/httprunner-linux-aarch64.tar.gz")
sha256sums_x86_64=('ff0cf6568230625ddbbe4d5ea65824d1666032baefa7c3366c7dce24084e59ef')
sha256sums_aarch64=('4f03f1e7eccb4be9cdefcf62f03a6b025f0b4aa5ac61430220156057903d669c')

package() {
  install -Dm755 httprunner "$pkgdir/usr/bin/httprunner"
  install -Dm755 httprunner-tui "$pkgdir/usr/bin/httprunner-tui"
  install -Dm755 httprunner-gui "$pkgdir/usr/bin/httprunner-gui"
  install -Dm644 httprunner-gui.desktop "$pkgdir/usr/share/applications/httprunner-gui.desktop"
  install -Dm644 "httprunner-gui-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/httprunner-gui.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
