# Maintainer: sushihead46 <fredferridge@gmail.com>
pkgname=arch-bounce
pkgver=1.0.0
pkgrel=1
pkgdesc="Bouncing Arch Linux logo terminal screensaver"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/sushihead46/arch-bounce"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sushihead46/arch-bounce/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c000e4b2aab2d9e8b9cfbe22e10d7eac246270708e52a0f5826ac77d0b5dc0d1')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
