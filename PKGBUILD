# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-vcs-bin
pkgver=0.8.3
pkgrel=1
pkgdesc='Lore is a next-generation, open source version control system'
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('glibc' 'libgcc')
arch=('x86_64' 'aarch64')
conflicts=('lore-vcs')
provides=('lore-vcs')
source=("$url/releases/download/v$pkgver/lore-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('55eb9e6d334c3c8d099e281931d4594a13dbda401e4cd202fa9f3114c512b299')

package() {
  install -Dm755 "$srcdir/lore" "$pkgdir/usr/bin/lore"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"

  "$pkgdir/usr/bin/lore" completions bash >lore-completion-bash
  "$pkgdir/usr/bin/lore" completions zsh >lore-completion-zsh
  install -Dm644 lore-completion-bash "$pkgdir/usr/share/bash-completion/completions/lore"
  install -Dm644 lore-completion-zsh "$pkgdir/usr/share/zsh/site-functions/_lore"
}
