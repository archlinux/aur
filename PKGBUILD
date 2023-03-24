# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
license=('Apache')
changelog=CHANGELOG
b2sums_x86_64=('3e7988c2c9405aa757106ce1303741ff99f89904cc7ece8c417d3d9c715897b2c3a275a3b53beeb617f75641ea29aff8fcc514f129cf4438fe3ddfb4f1826f38')
b2sums_aarch64=('a08795e15ae7e63ef6938ee9f71c44ca2b3d7188519d1192b2e5bd6bbac2110c320fc4c9224792729ea34613c7764a22172b12f5fabb01eed52da05ef1d04018')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
