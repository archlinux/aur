# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=battlestar
pkgver=0.3
pkgrel=1
pkgdesc='Programming language for creating tiny executables'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/battlestar'
license=('MIT')
makedepends=('go' 'git')
depends=('yasm' 'gcc' 'elfkickers')
optdepends=('dosbox: for running 16-bit programs')
source=("git://github.com/xyproto/battlestar.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  make -C "$pkgname"
}

package() {
  cd "$pkgname"

  make install DESTDIR="$pkgdir"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r samples "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples64 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples32 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples16 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r helloworld "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 tutorial.md "$pkgdir/usr/share/doc/$pkgname/tutorial.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
