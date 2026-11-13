# Maintainer: liyp <liyp@users.noreply.github.com>
pkgname=winc-bin
pkgver=0.1.626
pkgrel=1
pkgdesc='A lighter, faster desktop code editor (prebuilt binary from official Winc repo)'
arch=('x86_64')
url='https://winc.si'
license=('Apache-2.0')
depends=(
  'glibc>=2.39'
  'libgcc'
  'fontconfig'
  'ttf-dejavu'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxrandr'
  'wayland'
)
conflicts=('winc')
provides=('winc')
source=("https://winc.si/releases/arch/x86_64/winc-${pkgver}-1-${arch}.pkg.tar.zst")
sha256sums=('9583e6065aa5e931e949337ed2f6f98e716d26f79b05594415596a5bfe2a3c8f')

package() {
  bsdtar -xf "$srcdir/winc-${pkgver}-1-${arch}.pkg.tar.zst" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL' \
    -C "$pkgdir"
}
