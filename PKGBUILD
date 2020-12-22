# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=socklab
pkgver=1.1.1
pkgrel=1
pkgdesc="Shell interface for teaching the socket API"
arch=('x86_64' 'i686')
url="http://socklab.forge.imag.fr/"
license=('custom:CeCILL2')
depends=('readline')
source=("https://github.com/drakkar-lig/socklab/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5b24a229a9a3d66d7529da34279c58f92dc97804b3d64615c87cd872fb13aeb4')

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
