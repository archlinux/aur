pkgname=chicken-multipart-form-data
_name=multipart-form-data
pkgver=0.2
pkgrel=1
pkgdesc='Reads & decodes HTTP multipart/form-data requests for Chicken Scheme'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-intarweb" "chicken-comparse" "chicken-records")
url='http://wiki.call-cc.org/eggref/5/multipart-form-data'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

