# Maintainer: smiley <smiley@archlinux.org>

pkgname=hyprlogin-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Work-in-progress greetd greeter forked from hyprlock (pre-built binary)'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/hyprlogin'
license=('BSD-3-Clause')
provides=('hyprlogin')
conflicts=('hyprlogin')
depends=(
  'cairo'
  'gcc-libs'
  'glibc'
  'hyprgraphics'
  'hyprlang'
  'hyprutils'
  'libdrm'
  'mesa'
  'pango'
  'pam'
  'sdbus-cpp'
  'wayland'
  'libxkbcommon'
)
optdepends=(
  'greetd: login manager integration'
  'hyprland: greeter compositor session'
)
backup=('etc/hyprlogin/hyprlogin.conf')
options=(!debug)
source=(
  "hyprlogin-$pkgver::$url/releases/download/v$pkgver/hyprlogin"
  "hyprlogin.conf::$url/raw/refs/tags/v$pkgver/assets/example.conf"
  "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  '6d7e1e8d6278b015e1a787f90b30c28b62eb5bfe025da383534d7b2826287007'
  'b389671b92182995dc3313ce3a8f9ae0c062dc0c55c6d6341519c2294815b9dd'
  '52d07f3457591b4496ae2e79b05efd63c7df72135666fa12428d83078c4c0de5'
)

package() {
  install -Dm755 "$srcdir/hyprlogin-$pkgver" "$pkgdir/usr/bin/hyprlogin"
  install -Dm644 "$srcdir/hyprlogin.conf" "$pkgdir/etc/hyprlogin/hyprlogin.conf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
