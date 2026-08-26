# Maintainer: Reza Jelveh <reza.jelveh+git@gmail.com>
pkgname=browserchooser
pkgver=0.1.5
pkgrel=1
pkgdesc="rofi-style browser selector"
arch=('x86_64')
url="https://github.com/fishman/browserchooser"
license=('MIT')
depends=('glibc' 'libglvnd' 'wayland' 'libxkbcommon')
makedepends=('go' 'gcc' 'libglvnd' 'mesa' 'wayland' 'libxkbcommon')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -tags wayland -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 dev.fishman.browserchooser.desktop \
    "$pkgdir/usr/share/applications/dev.fishman.browserchooser.desktop"
}
