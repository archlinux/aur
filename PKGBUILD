pkgname=chicken-dbus
_name=dbus
pkgver=0.97
pkgrel=1
pkgdesc='A binding for libdbus, the IPC mechanism for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("chicken" "chicken-miscmacros" "chicken-srfi-18" "chicken-foreigners")
url='http://wiki.call-cc.org/eggref/5/dbus'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

