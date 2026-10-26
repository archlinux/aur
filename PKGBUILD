# Maintainer: y0sif <https://github.com/y0sif>
pkgname=lawh-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Keyboard-driven whiteboard for people who think in Vim (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/y0sif/lawh'
license=('MIT' 'OFL-1.1')
# winit loads the Wayland or X11 libraries when lawh starts.
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon-x11')
provides=("lawh=$pkgver")
conflicts=('lawh' 'lawh-git')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lawh-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/lawh-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e65c4e7482e71f45ade02aa4a457b0ebae02cebf4839b3f628b70fbc5de66f25')
sha256sums_aarch64=('f12ed944f736bfb30160e5311ab48fa495ec5a6b4012408406e9f6af598a62e2')

package() {
  cd "lawh-v$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 lawh "$pkgdir/usr/bin/lawh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE THIRD-PARTY-LICENSES.txt Inter-OFL.txt Libertinus-OFL.txt
}
