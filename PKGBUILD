# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=asp32-git
pkgver=1
pkgrel=1
pkgdesc="Arch Linux build source file management tool (for Archlinux32)"
arch=(any)
url="https://git.archlinux32.org/archlinux32/asp32"
license=(MIT)
depends=(awk bash jq git libarchive)
conflicts=(asp)
makedepends=(asciidoc)
source=("git+https://git.archlinux32.org/archlinux32/asp32.git")
md5sums=('SKIP')

build() {
  make -C asp32
}

package() {
  make -C asp32 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 asp32/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
