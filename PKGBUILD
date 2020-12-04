pkgname=pijul
pkgver=1.0.0_alpha.15
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo' 'clang' 'libsodium' 'gcc-libs' 'pkgconf' 'diffutils' 'make' 'xxhash')
depends=('zstd' 'openssl' 'xxhash')
arch=('i686' 'x86_64')
license=('GPL')
sha256sums=()

build() {
    return 0
}

package() {
    cargo install $pkgname --no-track --locked --all-features --root "$pkgdir/usr/" --version "${pkgver//_/-}"
    rm -f "$pkgdir/usr/.crates.toml" "$pkgdir/usr/.crates2.json"
}
