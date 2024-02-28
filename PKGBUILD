# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=2.2.1
pkgrel=1
pkgdesc='A pass extension that provides an easy flow for updating passwords.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL-3.0-or-later')
depends=('pass')
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('ab3dff67eed5ffc2f51df7ea9787195db4f7443af0ce772952c92fe5c7c828ce63b8a65d0b985a39e1e10e0a8d6a3217fe50f33d4f13e60ec3fc259a84554ebb'
            'SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

check() {
  cd "$pkgname-$pkgver"
  make tests
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
