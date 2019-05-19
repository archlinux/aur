# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.5
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml' 'python-pyaml')
makedepends=('python-setuptools')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('474c489acdc22c39f797f4d0afaf8c298ac1c24f0aa0d8cce584bce55a304ec48f6f412fe5083732bb25500e7f14ffe4a7c5326c810ec091128b1c829c672420'
            '1784188f60b75a19f53e6cf758dd41e1a9c0ea75f9a90ba86673b837568e06c4321552a3a695927d46fe2ac59b4dec54dca94986cbb845336ce41991d78f1ba8')

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
