# Maintainer: linus.mussmaecher@gmail.com
pkgname=rucola-notes
pkgver=0.3.6
pkgrel=1
pkgdesc="Terminal-based markdown note manager."
url="https://github.com/Linus-Mussmaecher/rucola"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("rucola-notes")
conflicts=("rucola-notes")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Linus-Mussmaecher/rucola/archive/v$pkgver.tar.gz")
sha256sums=("5cd3d1336c053397ad39516f451d002a5cfd21da3dac97dcad764b5f22cb1329")


build() {
    cd "rucola-$pkgver"

    cargo build --release
}

check() {
    cd "rucola-$pkgver"

    cargo test --release
}

package() {
    cd "rucola-$pkgver"

    install -Dm755 "target/release/rucola" "$pkgdir/usr/bin/rucola"
    # install -Dm755 "README.md" "$pkgdir/README.md"
}
