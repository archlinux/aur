# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.3-RC5
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
sha256sums=('348adb201b6fdfae07d5cacac9568c9b542d4d0add61a73e24f8da542aec8bda')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    make DESTDIR="$pkgdir/" install
}
