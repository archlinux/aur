# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.6.0
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

sha256sums=('fd21c004ec2e323bb74e95b688d019f417ca08d15aff04321e2e8c4b964e2db4')
sha256sums_x86_64=('c623638b2f070dcf3890ba6d98a8188a8d19d551a8dd056743a900d88e14e3db')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 taskfinder/USAGE.md -t "$pkgdir/usr/share/doc/taskfinder/"
  cp -av taskfinder/example_files/. "$pkgdir/usr/share/doc/taskfinder/examples/"
}
