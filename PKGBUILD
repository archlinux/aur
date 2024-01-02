pkgname=chicken-yaml
_name=yaml
pkgver=0.2.2
pkgrel=2
pkgdesc='Bindings to libyaml for Chicken Scheme'
arch=('x86_64')
license=('MIT')
depends=("libyaml" "chicken" "chicken-sql-null" "chicken-srfi-13" "chicken-srfi-69")
url='http://wiki.call-cc.org/eggref/5/yaml'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f -exec cp -t ${pkgdir}/usr/lib/chicken/11 {} +
}

