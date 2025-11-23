# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=35.0.24
pkgver=35.0.24
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64' 'x86_64_v3')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk-4.1')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("https://files.jriver-cdn.com/mediacenter/channels/v35/latest/MediaCenter-$_debpkgver-amd64.deb")
sha256sums=('e82f320ecf1f8c3754e24fb6cb53098ab1d7bc395a19dccd7ad302e290e898c9')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/jriver/Media Center 35/License.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
  rm -r "$pkgdir/etc"
}
