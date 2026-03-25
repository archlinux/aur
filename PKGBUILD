# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A lightweight desktop wrapper for SkyCrypt built with Rust and Tauri (precompiled binary)."
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

_debname="SkyCrypt.Desktop_0.1.7_amd64.deb"
source=("${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_debname}")
sha256sums=('d6655770811677085d808b43f23dc5e5f4bf5711bb73bf2120fddc19268de578')

package() {
  cd "$srcdir"
  ar x "${pkgname%-bin}_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
