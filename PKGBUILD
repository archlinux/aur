# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol
pkgver=2.2.5
pkgrel=2
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
    sha512sums=('6e8449e8b06c0f48e8e838c5116031f60d33f0384ce3785c46cff385a71f4b73a26e7bd2b24ea8a9d4599ccccd512fbf327c780c02b7f49a397afb613ac490c0')

else
    _MYARCH=32
    sha512sums=('094d6771c9a17a8bafe5ed27e8c2dac59f0eb59cbee5b8380f215cf25a42428b8baaa1f14b128d468d7af9c601fabf11a308fcf9b53084fe933aec4c81359470')

fi

source=("https://github.com/GaloisInc/cryptol/releases/download/v$pkgver/cryptol-$pkgver-CentOS6-$_MYARCH.tar.gz")

package() {
  cd "$srcdir/cryptol-$pkgver-CentOS6-$_MYARCH"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cryptol"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp bin/cryptol "$pkgdir/usr/bin"
  cp share/cryptol/* "$pkgdir/usr/share/cryptol"
  cp share/doc/cryptol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
