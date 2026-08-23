# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>

pkgname=gnucap
pkgver=20260729
pkgrel=1
pkgdesc="GNU Circuit Analysis Package"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('readline' 'termcap')
source=("https://codeberg.org/gnucap/gnucap/archive/${pkgver}-dev.tar.gz")
sha1sums=('50722b2316ea4f3ba09751f3852b16c5ab249d93')

build() {
  cd $pkgname
  ./configure --prefix=/usr --force-in-tree
  make DESTDIR="$pkgdir"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
