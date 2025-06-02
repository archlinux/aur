# Maintainer: Awkee <xiaoyu0720@gmail.com>
pkgname='libwaybar_cffi_lyrics'
pkgver=0.2.2
pkgrel=1
pkgdesc="a cffi module for waybar to get lyrics from various music providers"
_destdir=$HOME/.config/waybar/cffi

arch=('x86_64')
license=("GPL-3.0-or-later")

url="https://github.com/switchToLinux/libwaybar_cffi_lyrics"
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums_x86_64=('fb77fa85f62f6a7f9155c4348da9d96871ef4d475cc98c69ce3055c93bd86d1c')

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
