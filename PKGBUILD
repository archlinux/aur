# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.1-RC1
pkgver=${gitver//'-'/'_'}
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'gtk3' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("$pkgname-$gitver.tar.gz::https://github.com/BambooEngine/$pkgname/archive/v$gitver.tar.gz")
sha256sums=('5d2a4ce58a203d0e32f8c69f9358902d14f93d33c9c67b03a449e299e53fd49b')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    mkdir -p $pkgdir/usr/share/applications
    make DESTDIR="$pkgdir/" install
}
