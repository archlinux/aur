# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-bin
_pkgname=winkel
pkgver=0.1.4
pkgrel=1
pkgdesc="A metronome for Omarchy that follows the live theme (prebuilt binary)"
arch=(x86_64 aarch64)
url="https://github.com/DouglasdeMoura/winkel"
license=(MIT)
depends=(quickshell alsa-lib gcc-libs glibc hicolor-icon-theme)
optdepends=('ttf-jetbrains-mono-nerd: the default interface font')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('8d9997baa79f924904880fee8cfdd2deb8e1ffce8df178f9ffc52705158edd22')
sha256sums_aarch64=('d28912da2fcaee1cb261402f3ed9628c5f34df19e7aae81cbb4c91c873d51ecb')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
