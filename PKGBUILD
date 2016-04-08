# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.2.2
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
license=('BSD')
conflicts=('scim-spreadsheet')
source=("https://github.com/andmarti1424/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('c47ac3c273da804f9fda1c3bdcc5570f471fc26234183a9a1ed70f3e65a20cb7')
MAKEFLAGS='-j1'

build() {
  cd "$pkgname-$pkgver/src"
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
