# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('e1ff387cb30d5e0ca1287b267275c6ea98fea6ad3345091cf177b785612d42ee')
sha256sums_i386=('f07c8abca4ff864bf6fd996cba4959cdc334220908dbb48466e7692c2c09cd89')
sha256sums_x86_64=('a975e52ee20823d83cd0925d33c5094ead363b570934895de4c51b7311973129')

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
