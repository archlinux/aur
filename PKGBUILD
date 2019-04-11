# Maintainer: Storm Dragon <stormdragon2976@gmail.com>

_pkgname="tintin"
pkgname="tintin-beta"
pkgver=2019.04.11
pkgrel=1
pkgdesc="A console-based MUD client beta version"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="http://tintin.sourceforge.net/"
license=('GPL2')
depends=('zlib' 'pcre' 'gnutls')
options=('strip')
source=('http://tintin.sourceforge.net/download/tintin-beta.tar.gz')
conflicts=("tt++" "tintin")
provides=("tt++" "tintin")
replaces=("tt++" "tintin")
md5sums=('SKIP')

pkgver() {
    # Because there is no version number, the date will be used in yymmdd format.
    date '+%Y.%m.%d'
}

build() {
  cd $srcdir/tt/src
  sh configure --prefix=/usr --enable-big5
  make

}

package() {
  cd $srcdir/tt/src
  install -m755 -D tt++ $pkgdir/usr/bin/tt++
  ln -sf tt++ $pkgdir/usr/bin/tintin
}
