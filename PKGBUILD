# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=asp
pkgver=2
pkgrel=1
pkgdesc="Arch Linux build source file management tool"
arch=(any)
url="https://github.com/falconindy/asp"
license=(MIT)
depends=(awk bash jq git libarchive)
makedepends=(asciidoc)
source=($pkgname-$pkgver.tar.gz::https://github.com/falconindy/asp/archive/v$pkgver.tar.gz)
sha256sums=('e136e4c16850a97a510fb98a169f4a401adad7fc0575af2202e926327265dd4b')

build() {
  make -C asp-$pkgver
}

package() {
  make -C asp-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 asp-$pkgver/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
