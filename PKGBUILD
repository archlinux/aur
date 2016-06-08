# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: halhen <halhen at k2h dot se>

pkgname=xmlfs
pkgver=0.1.1
pkgrel=2
pkgdesc='Mount XML files as directory structures'
license=('GPL')
arch=('x86_64' 'i686')
url='http://github.com/halhen/xmlfs'
depends=('fuse' 'libxml2')
source=("git://github.com/halhen/xmlfs.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  make -C "$pkgname"
}

package() {
  cd "$pkgname"

  make PREFIX=/usr MANPREFIX=/usr/man DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
