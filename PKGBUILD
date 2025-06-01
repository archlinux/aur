# Maintainer: Awkee <xiaoyu0720@gmail.com>
pkgname='libwaybar_cffi_lyrics'
pkgver=0.2.0
pkgrel=1
pkgdesc="a cffi module for waybar to get lyrics from various music providers"
_destdir=$HOME/.config/waybar/cffi

arch=('x86_64')
license=("GPL-3.0-or-later")

url="https://github.com/switchToLinux/libwaybar_cffi_lyrics"
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums_x86_64=('172dbbf468f2d83896081a22c4d65964cd0fa3dfda7926bfbd6da8b7d4d91d75')

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
