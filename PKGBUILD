# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=36.0.26
pkgver=36.0.26
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk-4.1')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
source=("https://files.jriver-cdn.com/mediacenter/channels/v36/latest/MediaCenter-$_debpkgver-amd64.deb")
sha256sums=('d3bd620bb4152372dd399842f5f34bf242b6c9a075b7e5e54a126aefbe98f323')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/jriver/Media Center 36/License.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
  rm -r "$pkgdir/etc"
}
