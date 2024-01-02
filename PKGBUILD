pkgname=chicken-srfi-37
_name=srfi-37
pkgver=1.4
pkgrel=1
pkgdesc='A simple and flexible command-line option parsing facility for Chicken Scheme'
arch=('x86_64')
license=('SRFI')
depends=("chicken")
url='http://wiki.call-cc.org/eggref/5/srfi-37'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

