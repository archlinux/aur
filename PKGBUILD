# Maintainer: yancat <yancat_aur@icloud.com>
pkgname=zstbund
pkgver=1.0.2
pkgrel=4
pkgdesc='Bundle Arch Linux packages with all dependencies and GPG keys into a zip file for offline installation.'
arch=('x86_64')
url="https://github.com/yan-cat/zstbund"
license=('GPL3')
depends=('pacman' 'zip')
makedepends=('rust' 'cargo')
source=("zstbund-${pkgver}.tar.gz")
sha256sums=('a437ebccd5fa00dcadcbcb3c0e974aad2a83f565c1c4ff39ac19c3fac200932b')
options=('!debug')

build() {
  cd "$srcdir/zstbund"
  cargo build --release --locked
}

package() {
  cd "$srcdir/zstbund"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
