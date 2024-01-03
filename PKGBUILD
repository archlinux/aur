pkgname=chicken-posix-regex
_name=posix-regex
pkgver=0.1.0
pkgrel=1
pkgdesc='A thin wrapper around POSIX regular expression matching for Chicken Scheme'
arch=('x86_64')
license=('GPL-3')
depends=("chicken" "chicken-r7rs")
url='http://wiki.call-cc.org/eggref/5/posix-regex'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

