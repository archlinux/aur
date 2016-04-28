# Maintainer: Austin Haedicke

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/gtbjj/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2016.04
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
sha512sums=('bd6537f090dd258a6f843596a813452a5f62bdc96839f78243e93f32cfa9a70bfdc054ddb923aa8823c3fe3cf3e5698ead6d91cabbe0004979e6967d10d1c8bb')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
