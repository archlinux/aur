# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.3.5
pkgrel=2
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('mit')
depends=('glibc')
makedepends=('bison')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('4b4ad4a5a90706808d1e49ddcac6bde871e98aa9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
