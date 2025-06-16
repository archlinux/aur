# Maintainer: @JonasAlv
pkgname=zap-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple and minimal web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'libsoup' 'openssl')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+https://github.com/JonasAlv/zap-rs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/zap-rs" "$pkgdir/usr/bin/zap-rs"
}
