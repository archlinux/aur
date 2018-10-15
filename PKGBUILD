# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=1.1
pkgrel=2
pkgdesc='A pass extension that helps you to keep the whole tree of password encrypted inside a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass' 'tomb')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('12ea83856fc05ea754d5dfc9c2959430596cac04f8f645d454503e9ec5d2e6ee9d469cbb189db2b84d6e9f02e1a0ab8cc0cb26c658250c64e26b2d735775dec2'
            'b5498abca0fe4cbedcaa23dca98d82fdaea07cb20d3026d78e2102a4f485639ffce8370ef796133f934623e67230a4041323b8547d523a5f78ad2297cc537b7f')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
