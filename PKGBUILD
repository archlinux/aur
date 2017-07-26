# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2017c
pkgrel=1
pkgdesc='A cross-platform software package for econometric analysis, written in the C programming language'
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw' 'gnuplot' 'gmp')
optdepends=('readline: provides a nice editable command line in gretlcli' 
	          'JSON-GLib: provides for parsing of data from various websites')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('cba7ef3a094d98b50d991c67de443a5bc4dc75233af134c1f6a379fcdfeda846')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
