pkgname=prizrak-box-bin
pkgver=2.0.0_rc05
pkgrel=1
pkgdesc="A Simple Mihomo GUI (prebuilt Rust + Slint build)"
arch=('aarch64' 'x86_64')
url="https://github.com/legiz-ru/Prizrak-Box"
license=('GPL-3.0-only')
provides=('prizrak-box')
conflicts=('prizrak-box')
depends=('gtk3' 'libayatana-appindicator' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'alsa-lib' 'polkit' 'xdg-utils')
options=('!strip' '!debug')
install=prizrak-box.install
noextract=("prizrak-box-2.0.0_rc05-aarch64.tar.zst" "prizrak-box-2.0.0_rc05-x86_64.tar.zst")
source_aarch64=("prizrak-box-2.0.0_rc05-aarch64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc05/linux-arm64-aur.tar.zst")
source_x86_64=("prizrak-box-2.0.0_rc05-x86_64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc05/linux-amd64-aur.tar.zst")
sha256sums_aarch64=('6f11a19bb385824a531380c850ec21596f70565d5889da687b88f0d0ee1b63d7')
sha256sums_x86_64=('bb5b13be63e85bee646e7b7d3392cccdac9304dfb422b1a0b79db325f923cc98')

# The source is the release's pacman package. It goes straight into
# $pkgdir: makepkg and AUR helpers keep $srcdir between builds, so
# copying usr/ from there also packs files of older versions.
package() {
  bsdtar -xpf "${srcdir}/prizrak-box-${pkgver}-${CARCH}.tar.zst" -C "${pkgdir}" usr
}
