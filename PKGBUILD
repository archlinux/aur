# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=quirky
pkgver=1
pkgrel=1
pkgdesc="Destined to be a real IRC client for both light and heavyweight IRC users."
arch=('i686' 'x86_64')
url="https://github.com/solus-project/quirky"
license=('GPL2')
depends=('gtk3<=3.14')
makedepends=('vala')
source=("https://github.com/solus-project/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4ed61bdfac171cd61eb9976ad9d1afc7024bccd84a62a981054b3dc2aaa9da21')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -vfi
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "src/${pkgname}" -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
