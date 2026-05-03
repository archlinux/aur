# Maintainer: Fred Ferridge <fredferridge@gmail.com>
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
sha256sums=('48b93677201037acafc0e761d26ac400477b71434ed4f7f26d917a4d9a1a25e8')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
