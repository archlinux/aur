# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii
pkgver=20151120
pkgrel=1
pkgdesc="IRC and ICB client that runs under most UNIX platforms."
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/ircii/"
license=('BSD')
depends=('lftp' 'ncurses')
conflicts=('ircii-current')
source=("http://ircii.warped.com/$pkgname-$pkgver.tar.gz")
md5sums=('98ae95838a41e739abe94efb4af621a9')
sha1sums=('d74ef52ddb7b9f476e54d50f860cb41ea88db8cb')
sha256sums=('15d3c0df4caf2b9f5803af70cc28f6f94ac0ceffcda4bb31494816978e600d9d')

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

