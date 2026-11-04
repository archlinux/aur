# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-cli-bin
pkgver=0.15.0
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
sha256sums_x86_64=('989b4eb6858f83d2861e253e90ef1958ee843a8a653c2c19e81ec20815b6be68')
sha256sums_aarch64=('bd0e2ec037a30f9fecb3100b3822ed3b06dd6c263ff4240b938922bb4c9cb2d4')

package() {
  cd "daftar-cli-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 daftar-cli "$pkgdir/usr/bin/daftar-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
