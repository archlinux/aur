# Maintainer: Lucas Burlingham <lucas at lucasburlingham dot me>

pkgname=gnome-shell-extension-dash2dock-lite
_pkgname=dash2dock-lite
pkgrel=1
pkgver=1
pkgdesc="Minimal implementation of dash to dock"
arch=('any')
url="https://github.com/icedman/dash2dock-lite"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'make')
provides=('gnome-shell-extension-dash2dock-lite')
source=("git+https://github.com/icedman/dash2dock-lite.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make build
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR=${pkgdir} VERSION="${pkgver}" install
}
