# Maintainer: J Henrique <jhenrique04@proton.me>
pkgname=cargo-licenses
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to audit license information for Rust projects"
arch=('x86_64')
url="https://github.com/jhenrique04/cargo-licenses"
license=('MIT' 'Apache')
depends=('rust' 'cargo')
source=("https://github.com/jhenrique04/cargo-licenses/releases/download/$pkgver/cargo-licenses-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('b465762f00001a9faffffeaf66ff9dc80868a0f7a6109e8432f239cc01a7088b')

package() {
  tar -xvzf "cargo-licenses-v$pkgver-x86_64-linux.tar.gz"
  install -Dm755 "cargo-licenses" "$pkgdir/usr/bin/cargo-licenses"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

# Gere o .SRCINFO com:
# makepkg --printsrcinfo > .SRCINFO
