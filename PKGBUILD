# Maintainer: Douglas Moura <doug@douglasmoura.com>
pkgname=winkel-bin
_pkgname=winkel
pkgver=0.1.2
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
sha256sums_x86_64=('be3489b43918a9c9f53917ea0d48ce58c455e2b6ea0802a64472e03768777182')
sha256sums_aarch64=('5cdc4c38772c0b0003d6daa4bb9270a9510ccff94f056f1262d0d1af7a763416')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
