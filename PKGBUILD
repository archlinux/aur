# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=socklab
pkgver=1.1.2
pkgrel=1
pkgdesc="Shell interface for teaching the socket API"
arch=('x86_64' 'i686')
url="https://github.com/drakkar-lig/socklab"
license=('custom:CeCILL2')
depends=('readline')
source=("https://github.com/drakkar-lig/socklab/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1f3050412c09f3821b2da9a1fd21d98805417022dfbe6a1d06c3bb680ed1d0d3')

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
