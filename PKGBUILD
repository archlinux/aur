# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=1.3
pkgrel=1
pkgdesc='A pass extension that helps you to keep the whole tree of password encrypted inside a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=(
  'pass'
  'tomb'
)
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('8b57ce193e0fcc6861d963dd468acad6e92e8695e4a0f15128ea94acb2a029158b82e467acdef09821aa530c97f738d6a042af03b81798ea45b3d2c9780b6702'
            '7f1d4b25cf3a5b1710491c3883cc1db332f4a72152c19830c9ddbacf28a06f9d37d1ce3e6d2869e12ae5c85d4afc7602f951028c4aea06da4f2bfb52ef22a827')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

# The checks require root access
# check() {
#   cd "$pkgname-$pkgver"
#   make tests
# }

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
