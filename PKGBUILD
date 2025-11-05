# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=34.0.71
pkgver=34.0.71
pkgrel=2
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64' 'x86_64_v3')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk-4.1')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("https://files.jriver-cdn.com/mediacenter/channels/v34/latest/MediaCenter-$_debpkgver-amd64.deb" 'License.txt')
sha256sums=('f7b3a481347abb9111bf89e8ed46676195d1b6a75c89233ccf8cc0d41118781b' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm -r "$pkgdir/etc"
}
