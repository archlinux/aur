# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=35.0.27
pkgver=35.0.27
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk-4.1')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
source=("https://files.jriver-cdn.com/mediacenter/channels/v35/latest/MediaCenter-$_debpkgver-amd64.deb")
sha256sums=('61d95d34ff050a88b3fe771dbe687bf546aca4d47edcff278b0f2d328ff46182')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/jriver/Media Center 35/License.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
  rm -r "$pkgdir/etc"
}
