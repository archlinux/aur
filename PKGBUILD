# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.13.0
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

sha256sums=('34295315a06138102cacded5427153bc190cd330a2b679b1be70c17c5c684148')
sha256sums_x86_64=('f169330280470140cedac6094c9f3d038611808a7063a6bada871b84a14050e1')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 taskfinder/USAGE.md -t "$pkgdir/usr/share/doc/taskfinder/"
}
