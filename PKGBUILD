# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=28.0.68
pkgver=28.0.68
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'libxext' 'gtk3')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("http://files.jriver.com/mediacenter/channels/v28/latest/MediaCenter-$_debpkgver-amd64.deb" 'License.txt')
sha256sums=('0c437deb431173ca72c16371e204ba3720a9eb501d40507d8f3a272d584734a0' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
