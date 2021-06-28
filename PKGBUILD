# Maintainer: Lauri Gustafsson <me at gustafla dot space>

pkgname=lbreakouthd
pkgver=1.0.7
pkgrel=1
pkgdesc="Scaleable 16:9 remake of LBreakout2"
arch=("x86_64")
url="http://lgames.sourceforge.net/LBreakoutHD/"
license=("GPL3")
depends=("sdl2" "sdl2_ttf" "sdl2_image" "sdl2_mixer")
#makedepends=("")
source=("https://downloads.sourceforge.net/project/lgames/lbreakouthd/lbreakouthd-1.0.7.tar.gz")
md5sums=("fbddda9f5a5791aeb433b7bb440bf3ee")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/-Wno-format//g' configure
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

