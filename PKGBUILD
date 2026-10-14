# Maintainer: Ahmet Altindis
pkgname=wipsync-bin
pkgver=0.2.1
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
sha256sums=('e24ee814989e5b76d5fcf88c560247a6de25d56aa3edf0f6d56dd45c6014723c')

package() {
  cd "wipsync-$pkgver-x86_64"
  install -Dm755 wipsync "$pkgdir/usr/bin/wipsync"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/wipsync.bash "$pkgdir/usr/share/bash-completion/completions/wipsync"
  install -Dm644 completions/_wipsync "$pkgdir/usr/share/zsh/site-functions/_wipsync"
  install -Dm644 completions/wipsync.fish "$pkgdir/usr/share/fish/vendor_completions.d/wipsync.fish"
}
