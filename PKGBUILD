# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Robin Martinjak <rob@rmartinjak.de>
pkgname=correcthorse
pkgver=1.0
pkgrel=1
pkgdesc="Passphrase generator based on http://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
source=(http://rmartinjak.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3d691f786f5879f5b902585472d6d195')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
