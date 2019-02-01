# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-audit'
pkgver=1.0.1
pkgrel=1
pkgdesc='A pass extension for auditing your password repository.'
arch=('any')
url='https://github.com/roddhjav/pass-audit'
license=('GPL3')
depends=('pass' 'python' 'python-requests' 'python-zxcvbn')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('9504a2225ff5b30d800db68564bd1bb6909f98e7067cf917c8e6e11b59c76aab5bbf7e6360c66d35dd320c9716191ea503eb1de8138f35bdf073b793d1caa0d9'
            '30683bfdc157d755fc3e5a32f8d3fd5f6649d63a124bb22553478d3613c529bc999172a10b0b9c0674e1b6dc41d48e00f9c2dba4e71dc8864a9abfb77d1755a9')

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
