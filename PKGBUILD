# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=zathura-cb
pkgver=0.1.5
pkgrel=2
pkgdesc="Adds comic book support to zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-cb/"
license=('custom')
depends=('zathura' 'libarchive' 'desktop-file-utils')
conflicts=('zathura-cb-git')
source=(http://pwmt.org/projects/${pkgname}/download/$pkgname-$pkgver.tar.gz)
sha1sums=('a3de9fb4ae24b61c32bb8d46f1b0e733d484861a')


build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
