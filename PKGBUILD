# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.13
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('gtk4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/softwareperonista/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e0932a69e3797b65eca4f97bc7f8ff24730bdd98baed09cae072bcbbcdaaae57')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
