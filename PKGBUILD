# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='A terminal user interface that extracts and displays tasks from notes files'
url='https://codeberg.org/kdwarn/taskfinder'
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(glibc gcc-libs)
provides=(taskfinder)
conflicts=(taskfinder)

source=("$url/raw/tag/v$pkgver/USAGE.md")
source_x86_64=("bin-$pkgver-x86_64::$url/releases/download/v$pkgver/tf-linux")

sha256sums=('1a6b139417b7ad3637bb36caf4d1e275ca574fe2f8edce2dc63d32d3215b0983')
sha256sums_x86_64=('be728ff07ddf6ef540bbb8514e6a45ef9d1e40d4808078027b6dadc4c6aa504c')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 USAGE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
