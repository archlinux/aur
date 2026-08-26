# Maintainer: Reza Jelveh <reza.jelveh+git@gmail.com>
pkgname=browserchooser-x11
pkgver=0.1.6
pkgrel=1
pkgdesc="rofi-style browser selector (X11 backend)"
arch=('x86_64')
url="https://github.com/fishman/browserchooser"
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11' 'libxrandr' 'libxxf86vm' 'libxi'
  'libxcursor' 'libxinerama')
makedepends=('go' 'gcc' 'libglvnd' 'mesa' 'libx11' 'libxrandr' 'libxxf86vm'
  'libxi' 'libxcursor' 'libxinerama' 'xorgproto')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/browserchooser-$pkgver"
  go build -tags x11 -o browserchooser .
}

package() {
  cd "$srcdir/browserchooser-$pkgver"
  install -Dm755 browserchooser "$pkgdir/usr/bin/browserchooser"
  install -Dm644 dev.fishman.browserchooser.desktop \
    "$pkgdir/usr/share/applications/dev.fishman.browserchooser.desktop"
}
