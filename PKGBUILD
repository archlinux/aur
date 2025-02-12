# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=0.98.0
pkgrel=1
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('bf061b51a9109044caca95de22f8f2ccb0f4d714f25e951690d41c158ebe8d2d')
sha256sums_i386=('3629f16fcffe09813aedb7031b202515d1ffb6e7c5b69b5cb68120c14b9f1476')
sha256sums_x86_64=('8aae8e19a900f16736713076d6a339cebbe35ade23e26709c1acbc0b2f7f4f30')

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
