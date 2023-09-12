# Maintainer: willemw <willemw12@gmail.com>
# Contributer: MCOfficer <MCOfficer@gmx.de>

pkgname=whatfiles-git
pkgver=1.0.r5.ge4a6582
pkgrel=1
pkgdesc='Log what files are accessed by any process'
arch=(x86_64)
url=https://github.com/spieglt/whatfiles
license=(GPL3)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C $pkgname
}

package() {
  install -Dm755 $pkgname/bin/whatfiles -t "${pkgdir}/usr/bin"
}
