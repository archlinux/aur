# Maintainer: tee < teeaur at duck dot com >
pkgname=agentfs-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="The filesystem for agents"
arch=(x86_64)
url="https://agentfs.ai"
license=(MIT)
provides=(agentfs)
conflicts=(agentfs)
source=("agentfs-$pkgver.tar.xz.sha256::https://github.com/tursodatabase/agentfs/releases/download/v$pkgver/agentfs-x86_64-unknown-linux-gnu.tar.xz.sha256")
source_x86_64=("agentfs-$pkgver.tar.xz::https://github.com/tursodatabase/agentfs/releases/download/v$pkgver/agentfs-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('a6ef8d1e2709303d80790b378f9a259d2fb6c88d69792d97326bed96ca117249deeaecd0eb443502aa59f9cbe6b2f3c0c3e6105d951f5d70bd51e6ef26fefba5')
b2sums_x86_64=('3c62f51f73d864ece6248030ae8f4be033d0eada28f5664baca8ed73c0478a5f28ec9c355ace11c395783736dd572057de4edc0caab54da4706ccb1eaa4ab4ae')

package() {
  cd agentfs-$CARCH-unknown-linux-gnu
  install -Dm755 agentfs -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 <(COMPLETE=bash agentfs 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/agentfs"
  install -Dm644 <(COMPLETE=elvish agentfs 2>/dev/null) "$pkgdir/usr/share/elvish/lib/agentfs.elv"
  install -Dm644 <(COMPLETE=fish agentfs 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/agentfs.fish"
  install -Dm644 <(COMPLETE=zsh agentfs 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_agentfs"
}
