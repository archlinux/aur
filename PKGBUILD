# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.3-RC6
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
sha256sums=('c2b99680d0c601e48408e121c4858a81bb78977485682d4c6340249fd0ded985')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    make DESTDIR="$pkgdir/" install
}
