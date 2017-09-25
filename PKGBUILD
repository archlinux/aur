# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>

pkgname=gnucap
pkgver=20160724
pkgrel=1
pkgdesc="GNU Circuit Analysis Package"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline')
source=("http://git.savannah.gnu.org/cgit/$pkgname.git/snapshot/$pkgname-$pkgver.tar.gz")
sha1sums=('42b3ce44530e59f40387f70ab22a745c7b9e6272')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
