# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.2.0
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
_release="https://github.com/rockorager/monstar/releases/download/v1.2.0"
source_x86_64=("monstar-1.2.0-x86_64-linux.tar.gz::${_release}/monstar-1.2.0-x86_64-linux.tar.gz")
source_aarch64=("monstar-1.2.0-aarch64-linux.tar.gz::${_release}/monstar-1.2.0-aarch64-linux.tar.gz")
sha256sums_x86_64=('a2ab0723355840b673af56a3eb160d53c1bc4ee2b371b392d13dbb96e67d5afc')
sha256sums_aarch64=('19103455194b0163b7a153a84cff5b34fcb916c7a17381b2bcb98efa1225d764')

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
