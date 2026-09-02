# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-vcs-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Lore is a next-generation, open source version control system'
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('glibc' 'libgcc')
arch=('x86_64')
conflicts=('lore-vcs')
provides=('lore-vcs')
source=("$url/releases/download/v$pkgver/lore-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('05a1890406ff400d265e43c58afef4da2fdcb23642483766eb35bb0d4b904a5a')

package() {
  install -Dm755 "$srcdir/lore" "$pkgdir/usr/bin/lore"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"

  "$pkgdir/usr/bin/lore" completions bash >lore-completion-bash
  "$pkgdir/usr/bin/lore" completions zsh >lore-completion-zsh
  install -Dm644 lore-completion-bash "$pkgdir/usr/share/bash-completion/completions/lore"
  install -Dm644 lore-completion-zsh "$pkgdir/usr/share/zsh/site-functions/_lore"
}
