# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20150725
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150725')
md5sums=('1d16871b2b00cdbe1f8bc9c5864f399e')
sha1sums=('bac8431f50cf9e38d12c137830d0219176d28c19')
sha256sums=('e5835034b1358210e6e6da39ad959d9efeb6332bd904bb5fee302494e19cbbbd')

build() {
  cd $srcdir/deadbeef-fb.git
  ./autogen.sh
  ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd $srcdir/deadbeef-fb.git
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
