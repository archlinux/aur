# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-bin
_pkgname=winkel
pkgver=0.2.0
pkgrel=1
pkgdesc="A metronome for Omarchy that follows the live theme (prebuilt binary)"
arch=(x86_64 aarch64)
url="https://github.com/DouglasdeMoura/winkel"
license=(MIT)
depends=(alsa-lib gcc-libs glibc hicolor-icon-theme libxkbcommon libxkbcommon-x11 libxcb vulkan-icd-loader)
optdepends=('ttf-jetbrains-mono-nerd: the default interface font')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('31bb11226ca68eb4e447656eab5ca3d9c4420c43819ecf11bc6769b96b35c7f7')
sha256sums_aarch64=('faa4362c58c925eb4e9729bdf7039b278303dff5675edb001c0db3f424f54113')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
