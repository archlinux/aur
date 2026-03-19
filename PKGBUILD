# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight desktop wrapper for SkyCrypt built with Rust and Tauri."
arch=('x86_64')
url="https://github.com/GrishMahat/SkyCrypt-desktop"
license=('MIT')

provides=('skycrypt')
conflicts=('skycrypt')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'librsvg'
  'libayatana-appindicator'
  'libsoup3'
  'hicolor-icon-theme'
)

_debname="SKYCRYPT_DEB_NAME"
source=("${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_debname}")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  ar x "${pkgname%-bin}_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
