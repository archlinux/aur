# Maintainer: y0sif <https://github.com/y0sif>
pkgname=lawh-bin
pkgver=0.1.1
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
sha256sums_x86_64=('c646cbd994cfae8dc7b917f1c083922225779600e95d12fc54d39dacf47cc833')
sha256sums_aarch64=('24f8e278b03a0151392ecfc49c3fd180e558de876e30120b4ef1f769503a3e7f')

package() {
  cd "lawh-v$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 lawh "$pkgdir/usr/bin/lawh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE THIRD-PARTY-LICENSES.txt Inter-OFL.txt Libertinus-OFL.txt
}
