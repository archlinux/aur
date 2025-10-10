# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
epoch=1
pkgver=0.9.0
pkgrel=10
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/67e6d7eb2e20832b946319a4cc260434ed80d8f5.tar.gz"
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/${pkgname}-67e6d7eb2e20832b946319a4cc260434ed80d8f5"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-67e6d7eb2e20832b946319a4cc260434ed80d8f5"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kripton-authenticator.png"
}
