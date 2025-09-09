# PKGBUILD (converted from hyprviz-bin)
pkgname=hyprviz
pkgver=0.4.4
pkgrel=1
pkgdesc="GUI for configuring Hyprland!"
url="https://github.com/timasoft/hyprviz"
license=("GPL-2.0")
arch=("x86_64" "aarch64")
depends=(gtk4 glib2 desktop-file-utils hyprland )
makedepends=("cargo" "rust" "pkgconf" "pkg-config")
provides=("$pkgname")
conflicts=("hyprviz-bin")
source=("https://github.com/timasoft/hyprviz/archive/refs/tags/v0.4.4.tar.gz")
sha256sums=('38ff1dd602bb6cd4a8db327ec49556f102b07a72bb21d5d22445d9a876d41d34')

build() {
  cd "${srcdir}/hyprviz-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/hyprviz-${pkgver}"
  install -Dm755 target/release/hyprviz "${pkgdir}/usr/bin/hyprviz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  elif [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  fi
}
# Maintainer: timasoft <tima.klester@yandex.ru>
