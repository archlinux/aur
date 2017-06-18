# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=asp
pkgver=1
pkgrel=1
pkgdesc="Arch Linux build source file management tool"
arch=(any)
url="https://github.com/falconindy/asp"
license=(MIT)
depends=(awk bash jq git libarchive)
makedepends=(asciidoc)
source=($pkgname-$pkgver.tar.gz::https://github.com/falconindy/asp/archive/v$pkgver.tar.gz)
sha256sums=('df92416a2a991f0c89a7c152de99a41608a4810d45b8dc58613695e17a971fc3')

build() {
  make -C asp-$pkgver
}

package() {
  make -C asp-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 asp-$pkgver/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
