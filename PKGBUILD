# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.5
pkgver=${gitver//'-'/'_'}
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'gtk3' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git')
source=("$pkgname-$gitver.tar.gz::https://github.com/BambooEngine/$pkgname/archive/v$gitver.tar.gz")
sha256sums=('3451d86d55bf4a88ce88ba84ca5beb5360c0b2c42139b975ca7e3eafe9224bf9')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
