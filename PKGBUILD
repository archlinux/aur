# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=jriver-media-center
_debpkgver=32.0.58
pkgver=32.0.58
pkgrel=1
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64' 'x86_64_v3')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'gtk3' 'ca-certificates')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'vorbis-tools' 'musepack-tools')
conflicts=('jriver-media-center26' 'jriver-media-center25' 'jriver-media-center24')
source=("http://files.jriver.com/mediacenter/channels/v32/latest/MediaCenter-$_debpkgver-amd64.deb" 'License.txt')
sha256sums=('1810a68ef9cba7dc8c26082c0fbaec9d1e17de9a3142aa4453a8b99222b618d8' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm -r "$pkgdir/etc"
}
