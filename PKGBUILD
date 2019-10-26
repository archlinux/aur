# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii
pkgver=20190117
pkgrel=1
pkgdesc="IRC and ICB client that runs under most UNIX platforms."
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/ircii/"
license=('BSD')
depends=('lftp' 'ncurses')
conflicts=('ircii-current')
source=("http://ircii.warped.com/$pkgname-$pkgver.tar.gz")
md5sums=('f0ca9ade8aa068acddbe15b215c0b22a')
sha1sums=('568404f3b30358ec6639a372b3c7cbc7c8aa8360')
sha256sums=('a973a53c8bfa49b56f8acb841654d7400f6550ce69c1287c244e4a54d5b3b628')
sha512sums=('472666a5e494927d05bad28ffc4d63e31b752a23450fce43f0fb3fded610e561a9012b62654d992c0a7f837be68a2475eef856729416ebecddc7f714029d2a8b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" libexecdir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man/man1" install
  install -Dm644 doc/Copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

