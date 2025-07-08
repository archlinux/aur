# Maintainer: tarball <bootctl@gmail.com>

pkgname=taskfinder-bin
pkgver=2.11.0
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

sha256sums=('ead604a731b1fd5ce0926e29c10b03340444b6ad13751c37e053ecfe46408131')
sha256sums_x86_64=('e47327f3c759e019e29d7f4e1f31ba6a6c90d751b5b19deb545b38cc937377c2')

package() {
  install -Dm755 "bin-$pkgver-$CARCH" "$pkgdir/usr/bin/taskfinder"
  install -Dm644 taskfinder/USAGE.md -t "$pkgdir/usr/share/doc/taskfinder/"
}
