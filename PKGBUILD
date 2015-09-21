# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=jriver-media-center
_debpkgver=21.0.7
pkgver=$_debpkgver
pkgrel=2
pkgdesc="The Most Comprehensive Media Software"
arch=('x86_64')
url="http://www.jriver.com/"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp' 'util-linux' 'libxext' 'gtk2' 'p11-kit' 'libtasn1' 'libgnutls26')
optdepends=('mesa-libgl: nouveau video support' 'nvidia-libgl: nvidia video support' 'xorg-fonts-75dpi:' 'xorg-fonts-100dpi:' 'vorbis-tools:' 'lame:' 'musepack-tools:')
source=("http://files.jriver.com/mediacenter/channels/v21/latest/MediaCenter-$pkgver-amd64.deb" 'License.txt')
sha256sums=('271f3a92f2ece0a3d09f980bb1566edd5bbc226b53113b2f15030c38493efb4f' 'ee00f430918df6be37777a61e12812875b5583379c78daaa969bae7383a41fbd')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
    install -Dm644 "License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
