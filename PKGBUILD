# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.4
pkgrel=2
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml')
makedepends=('python-setuptools')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('0d8c2f640540338d99c7b931c158d2f2be7bff802fb13587c7a3476a0ce941cd220bbfc1ffccb19e82913e555c2db048b1876b57bdc659bb0cb9afff4c15f7d7'
            'fe0bb158331ffb905c730ce5742f616085f7a61bcc7e2e508314266b5b464a75d109d85da9e6eb172785e8477c80261affb9d3437b42190a991e314d3cdc6e21')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
