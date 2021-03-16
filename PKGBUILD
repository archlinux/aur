# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
pkgver=0.7.0
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("ibus-bamboo-$pkgver.tar.gz::https://github.com/BambooEngine/ibus-bamboo/archive/v$pkgver.tar.gz")
sha256sums=('4ac62345bfcebb87b8cd6af8657887f281e9423ff764435fc00045c400afb0dc')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
