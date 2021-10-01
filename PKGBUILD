# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=uat2tools-git
_gitname=dump978
pkgver=r74.5061476
pkgrel=1
epoch=1
pkgdesc="Just the uat tools from TanerH/dump978."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/TanerH/dump978"
license=('GPL2')
makedepends=('git')
source=('dump978::git+git://github.com/TanerH/dump978')
provides=("uat2tools")
conflicts=("uat2tools")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  make uat2json uat2text uat2esnt
}
 
package() {
  install -D -m 755 "${srcdir}/${_gitname}/uat2json" "${pkgdir}/usr/bin/uat2json"
  install -D -m 755 "${srcdir}/${_gitname}/uat2text" "${pkgdir}/usr/bin/uat2text"
  install -D -m 755 "${srcdir}/${_gitname}/uat2esnt" "${pkgdir}/usr/bin/uat2esnt"
}
