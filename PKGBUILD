# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-bin
_pkgname=winkel
pkgver=0.1.6
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
sha256sums_x86_64=('552ac57368d53a58ad6dcc4acc53b46872abd81f04c232c5b2c70713639b6bad')
sha256sums_aarch64=('a088db0baa60d75d987b8f38938b3778567663192534cad483086d94bae867e9')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
