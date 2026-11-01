# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-cli-bin
pkgver=0.12.0
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
sha256sums_x86_64=('923def29d566a03d94204b7d4fac121017d58e88a2e63b2a0af0b1c1928fb6d2')
sha256sums_aarch64=('4e1c931cd3e9103db67b5363811e8a8c152b75833d892ca23eff1927c2fe058e')

package() {
  cd "daftar-cli-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 daftar-cli "$pkgdir/usr/bin/daftar-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
