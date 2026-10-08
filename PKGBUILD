# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=36.0.40
pkgver=36.0.40
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk-4.1')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
source=("https://files.jriver-cdn.com/mediacenter/channels/v36/latest/MediaCenter-$_debpkgver-amd64.deb")
sha256sums=('8b72b3da4ae5155546d0fa321a56a5874e4571f89b7320ca9c0213ac8f8871cb')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/jriver/Media Center 36/License.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
  rm -r "$pkgdir/etc"
}
