# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.11
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('bb133f4a15499698cf0ba3f0ebea4e3e6f3dce7d952c2a490efb0383c8a1e508')
sha256sums_i386=('a5552db2bb449525aa3bdcd09e1e38a7891d39a1f6c4f0cdd35bb32a60299140')
sha256sums_x86_64=('d9628439986d9b9dd5d95569a399bb7d53ed8b235ef22820119695fd67eda72d')

optdepends=('libsql-server-bin: for turso dev (local development server) support')

# https://bbs.archlinux.org/viewtopic.php?id=292827
options=('!debug')

package() {
  cd "$srcdir"
  install -Dm755 'turso' "${pkgdir}/usr/bin/turso"

  install -Dm644 "completions/turso.bash" "$pkgdir/usr/share/bash-completion/completions/turso"
  install -Dm644 "completions/turso.fish" "$pkgdir/usr/share/fish/completions/turso.fish"
  install -Dm644 "completions/turso.zsh" "$pkgdir/usr/share/zsh/site-functions/_turso"
}
