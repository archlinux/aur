# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-bin
_pkgname=winkel
pkgver=0.2.1
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
sha256sums_x86_64=('241574bbd5d1088640e782a7ce45a4e24c4501e407ed8c3f33277e16f3a5b518')
sha256sums_aarch64=('2d948eca001fa2e60f32030db54153269645b8fec0cd9d9108a05328c0881559')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
