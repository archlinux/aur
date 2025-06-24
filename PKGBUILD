# Maintainer: Awkee <xiaoyu0720@gmail.com>
pkgname='libwaybar_cffi_lyrics'
pkgver=0.2.6
pkgrel=1
pkgdesc="a cffi module for waybar to get lyrics from various music providers"
_destdir=$HOME/.config/waybar/cffi

arch=('x86_64')
license=("GPL-3.0-or-later")

url="https://github.com/switchToLinux/libwaybar_cffi_lyrics"
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums_x86_64=('b71a2845d520507afe52af69c59badb41ef23ba71f9075ec1929e14e648c75b2')

makedepends=("meson" "git" "ninja")
depends=("gtk3" "libepoxy" "sdbus-cpp" "libcurl-gnutls" "glm")

build() {
  cd $srcdir/libwaybar_cffi_lyrics-$pkgver
  make
}

package() {
  cd $srcdir/libwaybar_cffi_lyrics-$pkgver
  make install DESTDIR="${_destdir}"
}
