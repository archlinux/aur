# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)
# Telegram @savagezen / @savagezen_aur
# GitHub https://github.com/savagezen/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2020.01
pkgrel=2
pkgdesc="Rakudo Perl6 on MoarVM with additional modules"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
optdepends=('zef')
provides=('rakudo-star' 'rakudo-moarvm')
conflicts=('rakudo-star' 'rakudo-moarvm')
source=(https://rakudo.org/dl/star/rakudo-star-$pkgver.tar.gz)
#source=(https://rakudostar.com/latest/star/source)
sha512sums=('9ab0010a6da01eef3df75fdb173ae072f660803140c076510a430694b72853e0707e06e3f4314dcb291cebf2f15c7b3572b495a75ec766666c7bf836db90c0b9')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --gen-moar --backend=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
