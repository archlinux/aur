# Maintainer: Tony Benoy <me@tonybenoy.com>
pkgname=screenpipe
pkgver=0.19.4
pkgrel=2
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/mediar-ai/screenpipe"
license=('MIT')
depends=('ffmpeg' 'tesseract' 'curl')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  # Build the application using cargo
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install the binary
  install -Dm755 "target/release/screenpipe" "$pkgdir/usr/bin/screenpipe"
  
  # Install additional documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

