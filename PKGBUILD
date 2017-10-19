# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.3.3
pkgrel=1
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('custom')
depends=('glibc')
makedepends=('bison')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('cc565066f2b9f2b0a454743efe8b3383d2a660e7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
  install -D LICENSE.md "$pkgdir/usr/share/licenses/rgbds-git/LICENSE.md"
}
