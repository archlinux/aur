# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Aaditya Bagga <aaditya_gnulinux@zoho.com>
pkgname=nbwmon
pkgver=0.5.2
pkgrel=2
pkgdesc="ncurses bandwidth monitor"
arch=('i686' 'x86_64')
url="https://github.com/causes-/nbwmon"
license=('custom:MIT/X')
depends=('ncurses')
conflicts=('nbwmon-git')
source=("https://github.com/causes-/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3244e8504168db04cf3b2b89769b83bb4663be803d4a5dd044b092f3a96c507f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
