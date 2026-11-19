pkgname=prizrak-box-bin
pkgver=2.0.0_rc04
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
noextract=("prizrak-box-2.0.0_rc04-aarch64.tar.zst" "prizrak-box-2.0.0_rc04-x86_64.tar.zst")
source_aarch64=("prizrak-box-2.0.0_rc04-aarch64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc04/linux-arm64-aur.tar.zst")
source_x86_64=("prizrak-box-2.0.0_rc04-x86_64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc04/linux-amd64-aur.tar.zst")
sha256sums_aarch64=('c02a89972ae32856cebeac2f9f5987df93e4ee049e48f1ed37d8b92609bf2b48')
sha256sums_x86_64=('60875ad51019284aaf6e76065d2380ff5cf2e57bf36cc5a502b69896fe4859e9')

# The source is the release's pacman package. It goes straight into
# $pkgdir: makepkg and AUR helpers keep $srcdir between builds, so
# copying usr/ from there also packs files of older versions.
package() {
  bsdtar -xpf "${srcdir}/prizrak-box-${pkgver}-${CARCH}.tar.zst" -C "${pkgdir}" usr
}
