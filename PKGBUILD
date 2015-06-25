# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol
pkgver=2.2.4
pkgrel=1
pkgdesc="A domain-specific language for specifying cryptographic algorithms."
url="http://www.cryptol.net"
arch=('x86_64' 'i686')
license=('BSD')
depends=('cvc4' 
         'gmp4'
         'libtinfo')
optdepends=('boolector: theorem proving'
            'mathsat-5: theorem proving'
            'yices-bin: theorem proving')
makedepends=()
conflicts=()
replaces=()
backup=()

if test "$CARCH" == x86_64; then
    MYARCH=64
    md5sums=('645ef1d70ee5ec4a22198952b2110916')

else
    MYARCH=32
    md5sums=('d8df335049bc9725abaaa90b5386ef8a')

fi

source=("https://github.com/GaloisInc/cryptol/releases/download/v$pkgver/cryptol-$pkgver-CentOS6-$MYARCH.tar.gz")

package() {
  cd "$srcdir/cryptol-$pkgver-CentOS6-$MYARCH"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cryptol"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
  cp bin/cryptol "$pkgdir/usr/bin"
  cp share/cryptol/* "$pkgdir/usr/share/cryptol"
  cp share/doc/cryptol/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
