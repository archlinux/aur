# Maintainer: esroyo <esroyo@gmail.com>
# Contributor: Olivier Brunel <jjk@jjacky.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=fpm2
pkgver=0.90
pkgrel=1
pkgdesc="Figaro's Password Manager 2"
arch=('i686' 'x86_64')
url="http://als.regnet.cz/fpm2/"
license=('GPL')
depends=('gtk3')
makedepends=('intltool>=0.35.0' 'pkgconf>=1.0')
source=(http://als.regnet.cz/$pkgname/download/$pkgname-$pkgver.tar.xz)
sha256sums=('1f3ab9c41c86267da97c48dda2f2333e163a3179fb21be1d34d4b4bf8792dfd1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
