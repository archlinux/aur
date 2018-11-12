# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)

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
sha512sums=('36d6f81d8f2fed218edb606bd29a3265cd258ba86100e7e406cc98ae121a4b076cf1489121568ecf5ce9448756029ee1ce3f05cc0ff331eca4f5d9f065576280')

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr --gen-moar --backend=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
