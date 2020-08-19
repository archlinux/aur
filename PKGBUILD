# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=chkascii
pkgver=2.2
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

sha256sums=('f3c764eaed78b3ae14f7def83aa0ef2f4752e75db06125373d9644a1567e1c05')
