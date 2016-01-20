# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol
pkgver=2.3.0
pkgrel=1
pkgdesc="A domain-specific language for specifying cryptographic algorithms."
url="http://www.cryptol.net"
arch=('x86_64' 'i686')
license=('BSD')
depends=(
  'cvc4' 
  'gmp4'
  'libtinfo'
)
optdepends=(
  'mathsat-5: theorem proving'
  'yices-bin: theorem proving'
)
makedepends=()
conflicts=()
replaces=()
backup=()

if test "$CARCH" == x86_64; then
    _MYARCH=64
    sha512sums=('3b4cda9c475d38ccba5eb6463abbcb66f6e9787b8cb078c6307217f616f824d1148091e8248bcdadf4a9bfb8f908938cbcd3e68b5edcd6700d2d10ef48e225fe')

else
    _MYARCH=32
    sha512sums=('059419edc18f2b049a026a786f3cb1520523304caab6c5904b4a5213878b7392c309e860965c3811f69fd210bda092595768b514903d08f171569dd9eb1d4d70')

fi

source=("https://github.com/GaloisInc/cryptol/releases/download/$pkgver/cryptol-$pkgver-CentOS6-$_MYARCH.tar.gz")

package() {
  cd "$srcdir/cryptol-$pkgver-CentOS6-$_MYARCH"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cryptol"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp bin/cryptol "$pkgdir/usr/bin"
  cp -r share/cryptol/* "$pkgdir/usr/share/cryptol"
  cp share/doc/cryptol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
