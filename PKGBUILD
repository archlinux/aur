# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=27.0.20
pkgver=27.0.20
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'libxext' 'gtk3')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("http://files.jriver.com/mediacenter/channels/v27/latest/MediaCenter-$_debpkgver-amd64.deb" 'License.txt')
sha256sums=('dd208eaf35c97f9286ed4cb36f328e50b1b4a4a8620e6fd9aba1b1867e93de36' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
