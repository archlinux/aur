# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt-bin
pkgver=0.1.6
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

_debname="SkyCrypt.Desktop_0.1.6_amd64.deb"
source=("${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_debname}")
sha256sums=('c9b5f7381a28b880c196a80d25eccfce3a99930e77324f34c669b01b31bbaf9b')

package() {
  cd "$srcdir"
  ar x "${pkgname%-bin}_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
