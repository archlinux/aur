# PKGBUILD (converted from hyprviz-bin)
pkgname=hyprviz
pkgver=0.4.3
pkgrel=1
pkgdesc="GUI for configuring Hyprland!"
url="https://github.com/timasoft/hyprviz"
license=("GPL-2.0")
arch=("x86_64")
depends=(gtk4 glib2 desktop-file-utils hyprland )
makedepends=("cargo" "rust" "pkgconf" "pkg-config")
provides=("$pkgname")
conflicts=("hyprviz-bin")
source=("https://github.com/timasoft/hyprviz/archive/refs/tags/v0.4.3.tar.gz")
sha256sums=('61568c5666ad76f17f0f9f1689ca11ef4d03922f2c33ef2f778a7a2aae014eef')

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
