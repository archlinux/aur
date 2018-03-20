# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: quomoow <quomoow@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gretl
pkgver=2018a
pkgrel=1
pkgdesc='A cross-platform software package for econometric analysis, written in the C programming language'
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
options=('!makeflags')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw' 'gnuplot' 'gmp')
optdepends=('readline: provides a nice editable command line in gretlcli' 'JSON-GLib: provides for parsing of data from various websites')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('f961fe48613cffd263bcb7ee3dff0bf5189d75b45a5cd03a062cfca381b455b7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-xdg-utils
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
