# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="wayland terminal based on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/rockorager/monstar"
license=('MIT')
provides=('monstar')
conflicts=('monstar')
depends=(
  'dbus'
  'fontconfig'
  'freetype2'
  'glibc'
  'harfbuzz'
  'libxkbcommon'
  'wayland'
)
optdepends=(
  'noto-fonts-emoji: emoji support'
  'noto-fonts-cjk: CJK font support'
  'systemd: launch additional terminal windows as user services'
  'vulkan-icd-loader: GPU rendering with renderer = vulkan'
  'xdg-desktop-portal: open links and files through a desktop portal'
  'xdg-utils: open links when a desktop portal is unavailable'
)
_release="https://github.com/rockorager/monstar/releases/download/v1.4.0"
source_x86_64=("monstar-1.4.0-x86_64-linux.tar.gz::${_release}/monstar-1.4.0-x86_64-linux.tar.gz")
source_aarch64=("monstar-1.4.0-aarch64-linux.tar.gz::${_release}/monstar-1.4.0-aarch64-linux.tar.gz")
sha256sums_x86_64=('d03adc16e50d41488d5250def02c8e5f75a70f3d186deca8b0c86db47e1c360e')
sha256sums_aarch64=('89b5c66f2990e50eaba05adf71987200c3bcf31567436c0b7b0f3a2564bc4709')

build() {
  :
}

check() {
  test -f "$srcdir/monstar-${pkgver}-${CARCH}-linux/share/terminfo/m/monstar"
}

package() {
  cd "$srcdir/monstar-${pkgver}-${CARCH}-linux"
  mkdir -p "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
