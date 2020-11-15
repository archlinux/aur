# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=chkascii
pkgver=2.4
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

sha256sums=('597b5c6052c5ad62d819686c0eac895e4f55aaf0656744a5341e36fc0d2c8658')
