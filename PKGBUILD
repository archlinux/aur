# Maintainer: Austin Haedicke

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/gtbjj/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2016.11
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
sha512sums=('77803d3e5e81c89d7a9ebbd6405c4675e58560a8feff555b3dd8a142d4460ad0f18c005e385788344f75efe79be4368a75d81f6aa346bd53792513c7775c99bd')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
