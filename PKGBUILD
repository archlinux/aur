pkgname=chicken-openssl
_name=openssl
pkgver=2.2.5
pkgrel=1
pkgdesc='Bindings to the OpenSSL SSL/TLS library for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("openssl-1.1" "chicken" "chicken-srfi-1" "chicken-srfi-13" "chicken-srfi-18" "chicken-address-info")
url='http://wiki.call-cc.org/eggref/5/openssl'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

