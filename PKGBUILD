# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.31
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('x86_64' 'aarch64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_x86_64=("turso-cli_Linux_x86_64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")
source_aarch64=("turso-cli_Linux_arm64_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")

sha256sums_x86_64=('84f5f564f778b3f3df2fee2aa56f0886db9acde654d80e66d95b9e228348d5a0')
sha256sums_aarch64=('dbc3c51edc4bbbc1c2a6be0585a28c79256cfd3f2dd1d4cdba961e7550db9dd5')

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
