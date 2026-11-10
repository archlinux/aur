# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.1.1
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
_release="https://github.com/rockorager/monstar/releases/download/v1.1.1"
source_x86_64=("monstar-1.1.1-x86_64-linux.tar.gz::${_release}/monstar-1.1.1-x86_64-linux.tar.gz")
source_aarch64=("monstar-1.1.1-aarch64-linux.tar.gz::${_release}/monstar-1.1.1-aarch64-linux.tar.gz")
sha256sums_x86_64=('05235ac07dac915155481c81a52eedc0831829e9583835bbd59ee1715f4a914a')
sha256sums_aarch64=('17c31195bede33f78b75fb70ab79490de1e488477681b51ad58e16d45467999a')

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
}
