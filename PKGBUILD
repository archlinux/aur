# Maintainer: Dan Denkijin <denkijin@proton.me>
pkgname=chalbik
pkgver=0.1.0
pkgrel=1
pkgdesc="Klingon Rain TUI - Terminal-based rain animation using pIqaD (Klingon script) characters"
arch=('x86_64')
url="https://github.com/dandenkijin/chalbik"
license=('MIT') # Adjust if different
depends=('rust')
makedepends=('git' 'cargo')
source=("git+https://github.com/dandenkijin/chalbik.git#tag=v${pkgver}")
sha256sums=('fef744853f0b20be3a157f3822263ab5cb5f30f03e41a1d9186f44e0e41d595b')

prepare() {
  cd "$srcdir/chalbik"
  # Add any pre-build steps if needed
}

build() {
  cd "$srcdir/chalbik"
  cargo build --release --target-dir=target
}

package() {
  cd "$srcdir/chalbik"
  install -Dm755 target/release/chalbik "$pkgdir/usr/bin/chalbik"
  install -Dm644 README.md "$pkgdir/usr/share/doc/chalbik/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chalbik/LICENSE" # If LICENSE exists
}
