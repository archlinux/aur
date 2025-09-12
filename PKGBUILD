# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.13
pkgrel=2
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("turso-cli_Linux_arm64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("turso-cli_Linux_i386_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("turso-cli_Linux_x86_64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('1d182bd3cf5ea99ecdb8209ab02e81f56d58a15b58ccc383a1c2e2886fdb06eb')
sha256sums_i386=('7b5a0a47efd235821d43ef80360e14618319e79e307f83ea8e9bf5d5113defe9')
sha256sums_x86_64=('dd6b85acdfed700a6d0e984728a6fcc44408b62a5df4c18aac2720e7c5ebbe6a')

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
