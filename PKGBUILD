# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('9ba6046a0f3f5c983c54e12c77ac17ab6476f86f58f2b5e389d03b1494f0224e')
sha256sums_i386=('b05dfa25041635684d0577d7165e3ab3b5fa95488221e121a9f78712652ff385')
sha256sums_x86_64=('9726eb7c57e3e780bf9003086f9579c01a4a319c338cc3b689e19ca4190520e1')

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
