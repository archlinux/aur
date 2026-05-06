# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.23
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('x86_64' 'aarch64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_x86_64=("turso-cli_Linux_x86_64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")
source_aarch64=("turso-cli_Linux_arm64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")

sha256sums_x86_64=('f84dd31922467506b074e01dd03679d78aba9270bee679b83e8c7c6bf7b0ee65')
sha256sums_aarch64=('bf6d1470cc5afd464377b5d35407e7f0ceff05a20d5e191e0dd3e712f4b9760d')

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
