# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=packrom
pkgver=1.4
pkgrel=1
pkgdesc='Uzebox(tm) ROM utility'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/Uzebox/uzebox'
depends=()
makedepends=()
source=('https://github.com/Uzebox/uzebox/archive/refs/tags/Uzem140_SDL1.tar.gz')
sha512sums=('9fa26a1c07eb550111681100deb6a23783ed7924a64a30fd7ee561214cacd9ca070d01fb60db9effc8a0c2455f6aa709ed45c2c71acb4c1c2afbca551c15ba79')

build() {
  cd "${srcdir}/uzebox/tools/packrom/"
  make release
}

package() {
  install -Dvm755 "${srcdir}/uzebox/tools/packrom/packrom" "${pkgdir}/usr/bin/packrom"
}

