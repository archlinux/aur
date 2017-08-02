# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/gtbjj/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2017.07
pkgrel=2
pkgdesc="Rakudo Perl6 on MoarVM with additional modules"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-star' 'rakudo-moarvm')
conflicts=('rakudo-star' 'rakudo-moarvm')
source=(http://rakudo.org/downloads/star/$pkgname-$pkgver.tar.gz)
sha512sums=('2fe8c55fe9ff2806cbdfd792e0f616bd5f58e931ba2d9a11684b3ebdf18ff8cc64565bbb1e73700ce47276f528fb80b0ad0427efe0e694113c036cf479b4fad1')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
