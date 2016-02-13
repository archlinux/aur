# Maintainer: Austin Haedicke

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/gtbjj/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2016.01
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
sha512sums=('3a93ee634bdcb286533a5535cd27889983d7e2fb6b997a952f00fff678e052875b6f40f831567b321a912af20f5c45ffc097a8f2b47a7ed19071579541ca57e5')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
