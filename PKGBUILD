# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator-bin
epoch=1
pkgver=2.0.0
pkgrel=1
pkgdesc="A secure, command-line Time-based One-time Password (TOTP) authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks. (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator"
license=('GPL3')
depends=('glibc')
# makedepends=('rust' 'git') # <<< DEĞİŞİKLİK: Artık derleme yapılmadığı için kaldırıldı

source=("https://github.com/clauderarch/kripton-authenticator/releases/download/v${pkgver}/kripton-authenticator-${pkgver}-bin-x86_64.tar.gz" 
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('24e662d65dbf50f51d8f448ee217e3e2493b7778dcc71a0f799fd722a0a8e6aa'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/kripton-authenticator" "$pkgdir/usr/bin/kripton-authenticator"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kripton-authenticator.png"
}
