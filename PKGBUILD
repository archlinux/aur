# Maintainer: Abdalrahman Shaban <abdalrahmanshaban52@gmail.com>
pkgname=islamic-prayer-timings
pkgver=1.2
pkgrel=2
pkgdesc="Utility and daemon to get Islamic prayer timings using aladhan.com API"
arch=('x86_64')
url="https://github.com/abdalrahmanshaban0/islamic-prayer-timings"
license=('GPL-3.0-or-later')
depends=('curl' 'libnotify')
makedepends=('git' 'cmake' 'nlohmann-json')
provides=("$pkgname")
conflicts=('islamic-prayer-timings-git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('ab0eab991f59e19910435c4643e6075a16f1e66a0e1a7822b5772081c110ece0')

build() {
  cmake -S "$srcdir/$pkgname" -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 build/islamic-prayer-timings "$pkgdir/usr/bin/islamic-prayer-timings"
}
