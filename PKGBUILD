# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii
pkgver=20210314
pkgrel=1
pkgdesc="IRC and ICB client that runs under most UNIX platforms."
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/ircii/"
license=('BSD')
depends=('lftp' 'ncurses')
conflicts=('ircii-current')
source=("http://ircii.warped.com/$pkgname-$pkgver.tar.gz")
md5sums=('21e9188dfb36f3c2632ebd5e353a01a5')
sha1sums=('78641597328d55ced56a0eef7c77caea7055bbf2')
sha256sums=('4322f185f2fb1d1385b65aecdcbc69c76b949472f317c75c10b6edb0bdfa4c12')
sha512sums=('518aaeb19304e57ecc578c3c6d49b3966d4a46b34202bc3a9c11b5aca6414cc4eeb9aea62ecb13e0e415d7d2256f095bfd4eb6137f2be56d4211a1aa514012f3')

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

