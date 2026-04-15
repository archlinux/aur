# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.20
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('x86_64' 'aarch64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_x86_64=("turso-cli_Linux_x86_64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")
source_aarch64=("turso-cli_Linux_arm64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")

sha256sums_x86_64=('cc60b35a20d603e78b370f04cd64780993d8faa30f654a9c378fe7eefd701297')
sha256sums_aarch64=('3c323c70ed68d0e948b94e1e0a5f80ef1b73c8ee0dc41eca98d6925a48195f31')

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
