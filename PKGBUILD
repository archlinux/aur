# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=socklab
pkgver=1.0.0
pkgrel=1
pkgdesc="Shell interface for teaching the socket API"
arch=('x86_64' 'i686')
url="http://socklab.forge.imag.fr/"
license=('custom:CeCILL2')
source=("https://github.com/drakkar-lig/socklab/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "build.patch")
sha256sums=('c85102d9121ffeea6f5070c796dda134c1865dd43dca6844f96244f5402564c7'
            '25250d4c60834dc29c9befd048d36b8f2805e8547e98d7cb021b78ccd5fa1386')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/build.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="/usr" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
