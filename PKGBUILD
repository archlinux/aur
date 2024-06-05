# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
gitver=0.8.4-RC1
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
sha256sums=('8ca197b5234a2a8c93ca9852376b8ba31cb29311fff26c53d6a1ffce538d1ef2')

build() {
    cd "$pkgname-$gitver"
    make
}

package() {
    cd "$pkgname-$gitver"
    make DESTDIR="$pkgdir/" install
}
