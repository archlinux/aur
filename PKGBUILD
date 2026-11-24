# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.4.1
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
_release="https://github.com/rockorager/monstar/releases/download/v1.4.1"
source_x86_64=("monstar-1.4.1-x86_64-linux.tar.gz::${_release}/monstar-1.4.1-x86_64-linux.tar.gz")
source_aarch64=("monstar-1.4.1-aarch64-linux.tar.gz::${_release}/monstar-1.4.1-aarch64-linux.tar.gz")
sha256sums_x86_64=('76869601b8243ddc088c83a801bdc2d7d2b488ae3ea439a494c84ca64ea44c86')
sha256sums_aarch64=('7f25f4ac0a0ccfeecc0b1043e2bba6e64280187bc344620a223db82bfe436506')

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
