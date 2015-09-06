# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: eric <eric@archlinux.org>

pkgname=hexcurse
pkgver=1.58
pkgrel=1
pkgdesc="Versatile ncurses-based hex editor."
arch=('i686' 'x86_64')
#url="http://directory.fsf.org/project/HexCurse/"
url="https://github.com/LonnyGomes/hexcurse"
license=('GPL')
depends=('ncurses>=5.6-7')
options=('!makeflags')
source=("https://github.com/LonnyGomes/hexcurse/archive/hexcurse-$pkgver.tar.gz"
        "hexcurse-alloca.patch")
#source=("http://www.sourcefiles.org/Editors/Hex/$pkgname-$pkgver.tar.gz")
#source=("http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz" 
md5sums=('26c3ccf56850ff030d5097ee4bbc2b0b'
         'fb7723bff0411392fe410839f6105e4f')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  #patch -p0 < ../hexcurse-alloca.patch

  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
