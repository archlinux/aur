# Mantainer: EarthMessenger <earthmessenger@qq.com>

pkgname=turso-cli-bin
pkgver=0.97.2
pkgrel=2
pkgdesc='Command line interface to Turso.'
arch=('arm64' 'i386' 'x86_64')
url='https://github.com/tursodatabase/turso-cli'
license=('MIT')
provides=('turso')

source_arm64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_arm64.tar.gz")
source_i386=("${url}/releases/download/v${pkgver}/turso-cli_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/turso-cli_Linux_x86_64.tar.gz")

sha256sums_arm64=('ee7dd584b8f8fcbaf6a31d51979789d2dc856df5f36a7c0ac58760b7696bce82')
sha256sums_i386=('d35a684089d6b781caf6fbbc1d8eaa70be3dd1dbbadd2d4aac93246d39172de4')
sha256sums_x86_64=('9aca2b82221451b3a6d2a35de6cfe713189ca5f950c5409eb309fccddd04afd6')

optdepends=('libsql-server-bin: for turso dev (local development server) support')

package() {
  cd "$srcdir"
  install -Dm755 'turso' "${pkgdir}/usr/bin/turso"

  install -Dm644 "completions/turso.bash" "$pkgdir/usr/share/bash-completion/completions/turso"
  install -Dm644 "completions/turso.fish" "$pkgdir/usr/share/fish/completions/turso.fish"
  install -Dm644 "completions/turso.zsh" "$pkgdir/usr/share/zsh/site-functions/_turso"
}
