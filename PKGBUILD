# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.10.0
pkgrel=1
pkgdesc='A terminal user interface that extracts and displays tasks from notes files'
url='https://codeberg.org/kdwarn/taskfinder'
arch=(x86_64)
license=(AGPL-3.0-or-later)
depends=(glibc gcc-libs)
provides=(taskfinder)
conflicts=(taskfinder)

source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("bin-$pkgver-x86_64::$url/releases/download/v$pkgver/tf-linux")

sha256sums=('1e4ed44b5be2be0af2035660262320164f770b07c5a06c9ec5bbbc42d2fd4583')
sha256sums_x86_64=('71aaa502acedd8034e220914e0677e8eae31b8fe4fd25ae94ee72a45bfbe9beb')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 taskfinder/USAGE.md -t "$pkgdir/usr/share/doc/taskfinder/"
}
