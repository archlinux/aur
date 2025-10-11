# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
epoch=1
pkgver=1.1.0
pkgrel=12
pkgdesc="A secure, command-line Time-based One-time Password (TOTP) authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption and Argon2id for strong master key derivation."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/918bca11ff6adb319bcc8e1dc27aded823c76bbb.tar.gz"
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/${pkgname}-918bca11ff6adb319bcc8e1dc27aded823c76bbb"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-918bca11ff6adb319bcc8e1dc27aded823c76bbb"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kripton-authenticator.png"
}
