# Maintainer: Austin Haedicke (austin.haedicke@gmail.com), Telegram @savageze

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/savagezen/pkgbuild

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Rafał Przywara <ptah.peteh (at) gmail (dot) com>

pkgname=rakudo-star
pkgver=2018.10
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
source=(http://rakudo.org/downloads/star/$pkgname-$pkgver.tar.gz)
sha512sums=('50b258409df71003e30563f8a080691f6316c33c958d90579f999b1efd9382292272032874e58953061d6336b1aa2a74a5fba63326480b85eaaf98e10ef6facc')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --gen-moar --backend=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
