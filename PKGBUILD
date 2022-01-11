# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.0-RC10
pkgver=${gitver//'-'/'_'}
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("ibus-bamboo-$pkgver.tar.gz::https://github.com/BambooEngine/ibus-bamboo/archive/v$gitver.tar.gz")
sha256sums=('12099ad06db6c6878fd642cf76b4b0c52d109a2913fa4fa567a045a7cc3d8cec')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    make DESTDIR="$pkgdir/" install
}
