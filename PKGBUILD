# Maintainer: Ahmet Altindis
pkgname=wipsync-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync work-in-progress folders between machines, through restic and ssh"
arch=(x86_64)
url="https://github.com/ahaltindis/wipsync"
license=(MIT)
depends=('restic>=0.17.1' openssh)
optdepends=('git: tell a refreshed git index from a real change')
provides=(wipsync)
conflicts=(wipsync)
options=(!debug)
source=("wipsync-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/wipsync-$pkgver-x86_64.tar.gz")
sha256sums=('37c3cf07c3da574e0970ddccdd42552c03f18819fad388a9de37350afd6b2cf9')

package() {
  cd "wipsync-$pkgver-x86_64"
  install -Dm755 wipsync "$pkgdir/usr/bin/wipsync"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/wipsync.bash "$pkgdir/usr/share/bash-completion/completions/wipsync"
  install -Dm644 completions/_wipsync "$pkgdir/usr/share/zsh/site-functions/_wipsync"
  install -Dm644 completions/wipsync.fish "$pkgdir/usr/share/fish/vendor_completions.d/wipsync.fish"
}
