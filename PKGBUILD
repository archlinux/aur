# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
epoch=1
pkgver=1.5.0
pkgrel=16
pkgdesc="A secure, command-line Time-based One-time Password (TOTP) authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/6747a64341770017709f16925f0df23db9ff0daf.tar.gz"
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/${pkgname}-6747a64341770017709f16925f0df23db9ff0daf"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-6747a64341770017709f16925f0df23db9ff0daf"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kripton-authenticator.png"
}
