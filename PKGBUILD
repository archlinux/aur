# Maintainer: Your Name <you@example.com>
pkgname=arch-bounce
pkgver=1.0.0
pkgrel=1
pkgdesc="Bouncing Arch Linux logo terminal screensaver"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/YOURUSERNAME/arch-bounce"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname::git+file://$PWD")
sha256sums=('SKIP')

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
