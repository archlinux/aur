# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.7.0
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

sha256sums=('272b2e3d0fab9c269cff9c394dce00820cd43336cd1fdb3c585c0d4119c0e127')
sha256sums_x86_64=('2c2b8c0aa5bbbf752a4b94cc80a900ad5624aaabd28ab6418b1101b85fed6311')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 taskfinder/USAGE.md -t "$pkgdir/usr/share/doc/taskfinder/"
  cp -av taskfinder/example_files/. "$pkgdir/usr/share/doc/taskfinder/examples/"
}
