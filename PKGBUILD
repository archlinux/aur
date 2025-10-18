# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator-bin
pkgver=2.1.7
pkgrel=1
pkgdesc="A secure, command-line TOTP authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks. (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator"
license=('GPL3')
depends=('glibc')
# makedepends=('rust' 'git')

source=("https://github.com/clauderarch/kripton-authenticator/releases/download/v${pkgver}/kripton-authenticator-${pkgver}-bin.tar.gz" 
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('43202c2e595c47cc11f410e430cb7c24e2079890aa012d3a3c9d9a0aaa62166d'
            '5c9cfee8d758686dc2426284b7b9ebb08a4fc5ae20fbfe647a5d69c25d546c70'
            'a04b394125d96dcbc94935cebcd5f26d4ad3f64b0ca8e41f7a437690422882c3')

package() {
  install -Dm755 "$srcdir/kripton-authenticator" "$pkgdir/usr/bin/kripton-authenticator"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/pixmaps/kripton-authenticator.png"
}
