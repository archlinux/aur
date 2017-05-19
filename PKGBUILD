# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=socklab
pkgver=1.0.1
pkgrel=1
pkgdesc="Shell interface for teaching the socket API"
arch=('x86_64' 'i686')
url="http://socklab.forge.imag.fr/"
license=('custom:CeCILL2')
depends=('readline')
source=("https://github.com/drakkar-lig/socklab/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f991aee63f303533325a86a8cb80e116835a20e54e866f1b09bafd4cd64df142')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="/usr" DESTDIR="$pkgdir/" install
  install -D -m644 Licence_CeCILL_V2-en.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 Licence_CeCILL_V2-fr.txt "${pkgdir}/usr/share/licenses/${pkgname}/Licence_CeCILL_V2-fr.txt"
}

# vim:set ts=2 sw=2 et:
