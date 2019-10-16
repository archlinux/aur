# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=git-backup
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool to help you backup your git repositories from services like GitHub '
arch=(i686 x86_64)
url=https://github.com/jsdw/git-backup
license=(MIT)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('4a181afbd6f424e97722711977913aee83a90529d1925ce2115f91a1108d5a543230ccaf14cbfc3b630ac09e85d7a5ca63b3b162286556496897961b0762e88b')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/git-backup -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

