# Maintainer: J Henrique <jhenrique04@proton.me>
pkgname=cargo-licenses
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to audit license information for Rust projects"
arch=('x86_64')
url="https://github.com/jhenrique04/cargo-licenses"
license=('MIT' 'Apache')
depends=('rust' 'cargo')
makedepends=('git')
source=("https://github.com/jhenrique04/cargo-licenses/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/cargo-licenses" "$pkgdir/usr/bin/cargo-licenses"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

# Generate .SRCINFO with:
# makepkg --printsrcinfo > .SRCINFO

