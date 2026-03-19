# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt-bin
pkgver=0.1.3
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

_debname="SkyCrypt.Desktop_0.1.3_amd64.deb"
source=("${pkgname%-bin}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_debname}")
sha256sums=('92e36d75a50acc02f0c3fee47beaa7886ed744d351adf6b8434a9d143fb5a8fd')

package() {
  cd "$srcdir"
  ar x "${pkgname%-bin}_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
