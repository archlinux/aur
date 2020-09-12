# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=chkascii
pkgver=2.3
pkgrel=1
pkgdesc="Check a file for any invalid ASCII characters"
arch=(x86_64)
license=('BSD')
url="https://github.com/bourne-again/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bourne-again/${pkgname}/archive/${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}

sha256sums=('c92fef5c76adc598f911e3e670fc03266eee280d2d466ff17ea4537497dd1970')
