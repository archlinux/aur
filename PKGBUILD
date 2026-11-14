# Maintainer: Coobyk <mail@coobyk.com>
# CI substitutes 0.1.0.r125.g65b48e8 and 85d77e160bc6d041f0488927b2888f7566737951bbeb2a3f5845121aca3eb8d1 for each published nightly build.
pkgname=mca-selector-rs-bin
_pkgname=mca-selector
pkgver=0.1.0.r125.g65b48e8
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
sha256sums=('85d77e160bc6d041f0488927b2888f7566737951bbeb2a3f5845121aca3eb8d1' 'SKIP' 'SKIP')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png"
}
