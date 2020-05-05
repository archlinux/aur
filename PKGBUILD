# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=chkascii
pkgver=2.0
pkgrel=1
pkgdesc="Check a file for any invalid ASCII characters"
arch=(x86_64)
license=(GPL2)
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
sha256sums=('b74972945e0baa008075b5181dc944c3f7f182c6fba27bc695ea9f62bdd76808')
