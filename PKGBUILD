# Maintainer: itlwas <itlwas@duck.com>

pkgname=yoc
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight, minimalist terminal text editor written in pure C"
arch=('x86_64' 'i686')
url="https://github.com/itlwas/yoc-editor"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d886f9b8dcb2d87486ee6eb5d68f604b8d45df8a95bd17f48ca65ac0b652b455')

build() {
    cd "$srcdir/yoc-editor-$pkgver"
    make release
}

package() {
    cd "$srcdir/yoc-editor-$pkgver"
    install -Dm755 yoc "$pkgdir/usr/bin/yoc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
