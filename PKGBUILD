# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator-bin
epoch=1
pkgver=2.0.1
pkgrel=2
pkgdesc="A secure, command-line TOTP authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks. (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator"
license=('GPL3')
depends=('glibc')
# makedepends=('rust' 'git')

source=("https://github.com/clauderarch/kripton-authenticator/releases/download/v${pkgver}/kripton-authenticator-${pkgver}-bin-x86_64.tar.gz" 
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('f1ae3f064846e809485c817251271911cbf3139ea13a620c4e08ab30cc56e1ee'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/kripton-authenticator" "$pkgdir/usr/bin/kripton-authenticator"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kripton-authenticator.png"
}
