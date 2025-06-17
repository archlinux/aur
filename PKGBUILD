# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=34.0.34
pkgver=34.0.34
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64' 'x86_64_v3')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates' 'webkit2gtk')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("https://files.jriver-cdn.com/mediacenter/channels/v34/latest/MediaCenter-$_debpkgver-amd64.deb" 'License.txt')
sha256sums=('48f4a33d896517f2e6aadb640595afad8834581cd373ffd01913bf4f889b91a8' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm -r "$pkgdir/etc"
}
