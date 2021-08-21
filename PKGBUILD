# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
pkgver=0.7.9
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("ibus-bamboo-$pkgver.tar.gz::https://github.com/BambooEngine/ibus-bamboo/archive/v$pkgver.tar.gz")
sha256sums=('d6e4f84254a8af6bcceaac80d2240f5b0ab5dfdbc71c84619e18545046867509')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
