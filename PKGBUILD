# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=adb-sync-git
pkgver=r36.76b2783
pkgrel=1
pkgdesc='Synchronize files between a PC and an Android device using ADB (Android Debug Bridge)'
arch=(any)
url=https://github.com/google/adb-sync
license=(Apache)
depends=(android-tools android-udev python)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $pkgname/{adb-sync,adb-channel} -t "$pkgdir/usr/bin"
}
