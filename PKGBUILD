# Maintainer: Sergey Desyatkov <sergeydesyatkov@proton.me>

pkgname=my-app-time
pkgver=1.0.0
pkgrel=1
pkgdesc="Your app usage time tracker"
arch=('x86_64')
url="https://github.com/desyatkas/my-app-time"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2725b6b0bd1bfc1888195e4f76107c5acd8256e0a8b7b825044bb872c2cca646')

build() {
    cd "$srcdir/my-app-time-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/my-app-time-$pkgver"
    install -Dm755 "target/release/my-app-time" "$pkgdir/usr/bin/mat"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/my-app-time/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/my-app-time/README.md"
}
