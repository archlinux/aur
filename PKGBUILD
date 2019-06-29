# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-tomb'
pkgver=1.2
pkgrel=1
pkgdesc='A pass extension that helps you to keep the whole tree of password encrypted inside a tomb.'
arch=('any')
url='https://github.com/roddhjav/pass-tomb'
license=('GPL3')
depends=('pass' 'tomb')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('818c034a5214d1712f59927f806df09e697a76010bbaf03eb6133a3443e17f41fba6bbe88a5a542209186502f64e985276112c562f917eef232a2fc3cacd79d8'
            'ebd8688da9b6b070830cf3a469e27c4d9776e61735e2140e7b6615fff5933b51b22d9048d597cfecada90f54f2cd9e3e9d1098489bf7166ad32248707fd0266f')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

# The checks require root access
# check() {
#   cd "$srcdir/$pkgname-$pkgver/"
#   make tests
# }

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
