# Maintainer: LongChampion <ThePalazin@Gmail.com>
pkgname=ibus-bamboo
pkgver=0.7.4
pkgrel=1
pkgdesc="A Vietnamese IME for IBus"
arch=(any)
url="https://github.com/BambooEngine/ibus-bamboo"
license=('GPL3')
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'bamboo-ibus-git')
source=("ibus-bamboo-$pkgver.tar.gz::https://github.com/BambooEngine/ibus-bamboo/archive/v$pkgver.tar.gz")
sha256sums=('1828e83b1d0e810da5ff41c20cfad6f38dd344061f8484c77bf5ada74eacb44d')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
