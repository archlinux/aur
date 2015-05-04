# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Bartlomiej Palmowski (Rotwang), maks1k at wp dot pl

pkgname=ck4up
pkgver=1.4
pkgrel=1
pkgdesc="Command-line utility to monitor web pages for updates"
arch=('any')
url="http://jue.li/crux/ck4up/"
license=('GPL')
depends=('ruby')
source=(http://jue.li/crux/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('181c8342e16a20bd6ebce0a6dd23b894')

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man/man1 install

  install -Dm644 $pkgname.conf "${pkgdir}"/usr/share/doc/$pkgname/$pkgname.conf.example
}
