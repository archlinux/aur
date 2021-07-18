# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
pkgver=0.7.7
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("ibus-bamboo-$pkgver.tar.gz::https://github.com/BambooEngine/ibus-bamboo/archive/v$pkgver.tar.gz")
sha256sums=('38b067d6406de128d32d9ae066a0747ad5f865583e15b4ae3508ccb8e8f13945')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
