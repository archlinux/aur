# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=2.2
pkgrel=1
pkgdesc='A pass extension that provides an easy flow for updating passwords.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('cfe6e99087624242cab0c5af046b0de10c52c76203ab22d31e8dafd1ce45276810f28d5814ddfe956c8fb7dce37a37e3242d004926c1ad8e750bb0702b6c27f5'
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
