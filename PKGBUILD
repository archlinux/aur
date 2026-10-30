# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-cli-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="The command line and TUI of Daftar, for an Obsidian vault in a Git repository"
arch=(x86_64 aarch64)
url="https://github.com/parham-alvani/notes-linux"
license=('GPL-3.0-only')
depends=(gcc-libs glibc)
optdepends=('git: syncing the vault')
provides=('daftar-cli')
conflicts=('daftar-cli' 'daftar-bin')
source_x86_64=("https://github.com/parham-alvani/notes-linux/releases/download/v${pkgver}/daftar-cli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/parham-alvani/notes-linux/releases/download/v${pkgver}/daftar-cli-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b42fe0f727c58069dc9cb3716993ce9bfe4d15f594c9740f2d2fdf9a5a28daff')
sha256sums_aarch64=('bada37190e853c32d050ca9b9431e5295855073126a2b8f5d0fd2a03071de052')

package() {
  cd "daftar-cli-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 daftar-cli "$pkgdir/usr/bin/daftar-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
