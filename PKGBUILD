# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Matthias Hueser <mail at mhueser dot de>
# Contributor: Daniel Griffiths <ghost1227 at archlinux dot us>

pkgname=rolo-git
pkgver=1
pkgrel=1
pkgdesc="Tracks your contacts with vCards and displays them to you with
 a text-based menu."
arch=('i686' 'x86_64')
url="https://github.com/yourealwaysbe/rolo"
license=('GPL')
depends=('ncurses' 'libvc-git')
makedepends=('autoconf')
conflicts=(rolo)
provides=(rolo)
source=(git://github.com/yourealwaysbe/rolo.git)
md5sums=('SKIP')

build() {
  cd $srcdir/rolo
  autoreconf -f -i
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/rolo
  make DESTDIR="$pkgdir" install
}

