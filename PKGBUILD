# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)
# Telegram @savagezenl / @savagezen_aur
# GitHub https://github.com/savagezen/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2019.03
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
source=(https://rakudostar.com/latest/star/source)
sha512sums=('f9632c6193b8b6fc5ba10d8eb2bf69560965b77bf1aa08af458f8a5fee52d9750bbbb2b2fcd42a0b609d925627940bb3167520a32a5df04cce8d2c4e7815b999')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --gen-moar --backend=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
