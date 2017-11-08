# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2017d
pkgrel=1
pkgdesc='A cross-platform software package for econometric analysis, written in the C programming language'
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
options=('!makeflags')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw' 'gnuplot' 'gmp')
optdepends=('readline: provides a nice editable command line in gretlcli' 'JSON-GLib: provides for parsing of data from various websites')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('e6639471a7e6b1c2f365088bebcae7048a7f7d14f392fafffb66a67913b12680')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
