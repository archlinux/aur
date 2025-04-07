# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('08892dd393e0f0b4e4ddfd4052f35c4ff72631da8f9235a18f1821d5e8540789')
sha256sums_i386=('5e294ecf7f55b7ee11c6c5c9bce9743888e523fffccc1735408fa6e9ca2f1792')
sha256sums_x86_64=('86e38e472a023860f800818f90c160677b84077e23f7abc4602151df6380b75e')

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
