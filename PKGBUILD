# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.26
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('x86_64' 'aarch64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_x86_64=("turso-cli_Linux_x86_64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")
source_aarch64=("turso-cli_Linux_arm64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")

sha256sums_x86_64=('97a4192f403943ad398b19cb6f73b2f796fbef8ce8674d4124eaff532bca3b03')
sha256sums_aarch64=('ad53d802e336b01d75d89b151a4d3c31ff7392ca5509a769a40f64ec99ac4338')

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
