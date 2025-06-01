# Maintainer: Awkee <xiaoyu0720@gmail.com>
pkgname='libwaybar_cffi_lyrics'
pkgver=0.1.0
pkgrel=1
pkgdesc="a cffi module for waybar to get lyrics from various music providers"
_destdir=$HOME/.config/waybar/cffi

arch=('x86_64')
license=("GPL-3.0-or-later")

url="https://github.com/switchToLinux/libwaybar_cffi_lyrics"
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums_x86_64=('b573dfd076761d17524de5d586aafc87682e0c57badc04f9f410eb8d512b5598')

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
