# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20150416
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="http://sourceforge.net/projects/deadbeef-fb/"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=(http://downloads.sourceforge.net/project/deadbeef-fb/master/deadbeef-fb_20150416_src.tar.gz)
md5sums=('787dae898be28e495847b16f8f8f3724')
sha1sums=('d6fd987628959b4ca610a822987af2f3a284976a')
sha256sums=('3e7feab7962da1b432d352f61b77f72901b2c1509c89e131df1c38583635a5db')

build() {
  cd $srcdir/deadbeef-fb-devel
  ./configure --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $srcdir/deadbeef-fb-devel
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
