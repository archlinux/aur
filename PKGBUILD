# Maintainer: Coobyk <mail@coobyk.com>
# CI substitutes 0.1.0.r130.gca6e9c2 and f8672cb0a4cbe6338344071eaaf59e1f55a8ffb0965b0276e2dd394f552d5d12 for each published nightly build.
pkgname=mca-selector-rs-bin
_pkgname=mca-selector
pkgver=0.1.0.r130.gca6e9c2
pkgrel=1
pkgdesc="A faithful Rust + GPUI port of MCA Selector (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/mca-selector-rs"
license=('MIT')
depends=('fontconfig' 'libxcb' 'libxkbcommon' 'wayland' 'alsa-lib')
provides=("$_pkgname")
conflicts=("$_pkgname" 'mca-selector-rs-git')
source=("${_pkgname}-${pkgver}.bin::https://github.com/Coobyk/mca-selector-rs/releases/download/nightly/mca-selector-linux-x86_64"
        "$_pkgname.desktop::https://raw.githubusercontent.com/Coobyk/mca-selector-rs/nightly/packaging/mca-selector.desktop"
        "$_pkgname.png::https://raw.githubusercontent.com/Coobyk/mca-selector-rs/nightly/packaging/mca-selector.png")
sha256sums=('f8672cb0a4cbe6338344071eaaf59e1f55a8ffb0965b0276e2dd394f552d5d12' 'SKIP' 'SKIP')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png"
}
