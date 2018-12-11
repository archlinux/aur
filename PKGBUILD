# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=2.1
pkgrel=1
pkgdesc='A pass extension that provides an easy flow for updating passwords.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('6f7e12ff8bc608bbfb5ae15efd13052896f247d53d9d092f1c1cc527a0e33d8f638264af2ca4af8c94d772c998f9d321cfceeaaad843fb8b5322a2e9bf7d08d5'
            '0e58890a2e661080e5e7248a6e3497a2558db14af3a695377c923aeca43bde361d6bafa88ebc35c9a132dfdacb167df76f7fcf1016e51a589baad7c37b32f96d')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
