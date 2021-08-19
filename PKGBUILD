# Maintainer: Nguyen Hong Hiep (justanoobcoder)
# Github: https://github/justanoobcoder

pkgname=nowater
pkgver=21.07
pkgrel=3
pkgdesc="A CLI tool that helps you set wallpaper or live wallpaper easily."
arch=(any)
url="https://github.com/justanoobcoder/nowater"
license=('GPL3')
depends=('feh' 'wget' 'jq' 'ffmpeg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(27eee9be668cbde727c2cf9343e98bb8)

pkgver() {
    cd "$pkgname-$pkgver"
    printf "%s" "$(awk -F '"' '/^_version/ {print $2}' $pkgname)"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
