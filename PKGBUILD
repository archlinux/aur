# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>

pkgname=gnucap
pkgver=20240220
pkgrel=1
pkgdesc="GNU Circuit Analysis Package"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline' 'termcap')
source=("git+https://git.savannah.gnu.org/git/gnucap.git#tag=${pkgver}")
sha1sums=('37c15fa12c96978434071094ba93de5a3aa2665d')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make DESTDIR="$pkgdir"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
