# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2017a
pkgrel=1
pkgdesc='A cross-platform software package for econometric analysis, written in the C programming language'
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw' 'gnuplot' 'gmp')
optdepends=('readline: provides a nice editable command line in gretlcli' 
	          'JSON-GLib: provides for parsing of data from various websites')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha1sums=('13f20c4c2e592c0d1045d105c55fed004e3513b5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
