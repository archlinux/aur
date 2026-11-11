pkgname=prizrak-box-bin
pkgver=2.0.0_rc03
pkgrel=1
pkgdesc="A Simple Mihomo GUI (prebuilt Rust + Slint build)"
arch=('aarch64' 'x86_64')
url="https://github.com/legiz-ru/Prizrak-Box"
license=('GPL-3.0-only')
provides=('prizrak-box')
conflicts=('prizrak-box')
depends=('gtk3' 'libayatana-appindicator' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'polkit' 'xdg-utils')
options=('!strip' '!debug')
install=prizrak-box.install
noextract=("prizrak-box-2.0.0_rc03-aarch64.tar.zst" "prizrak-box-2.0.0_rc03-x86_64.tar.zst")
source_aarch64=("prizrak-box-2.0.0_rc03-aarch64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc03/linux-arm64-aur.tar.zst")
source_x86_64=("prizrak-box-2.0.0_rc03-x86_64.tar.zst::https://github.com/legiz-ru/Prizrak-Box/releases/download/v2.0.0-rc03/linux-amd64-aur.tar.zst")
sha256sums_aarch64=('95a60f5777028598a86f4e7c2138ebe851e5e390cf1035a689c16ee0d735f24d')
sha256sums_x86_64=('e59619b19a61cbb3fd8dae429a4fed9b6ee0b59640df3a6403773db4913bd881')

# The source is the release's pacman package. It goes straight into
# $pkgdir: makepkg and AUR helpers keep $srcdir between builds, so
# copying usr/ from there also packs files of older versions.
package() {
  bsdtar -xpf "${srcdir}/prizrak-box-${pkgver}-${CARCH}.tar.zst" -C "${pkgdir}" usr
}
