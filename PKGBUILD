pkgname=chkascii
pkgver=2.0
pkgrel=1
pkgdesc="Check a file for any invalid ASCII characters"
arch=(x86_64)
license=(GPL)
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
md5sums=('65ef0c2f0f404d237aa3a3f22847534d')
