# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=quirky
pkgver=1
pkgrel=1
pkgdesc="Destined to be a real IRC client for both light and heavyweight IRC users."
arch=('i686' 'x86_64')
url="https://gitlab.com/ufee1dead/quirky"
license=('GPL2')
depends=('gtk3<=3.14')
makedepends=('vala')
source=("https://gitlab.com/ufee1dead/${pkgname}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('3f14ab8ade68e04a7fe7fb19d23050d437941bb626ee32f9f81482c73a143eb7')

build() {
  cd "${srcdir}/${pkgname}.git"

  autoreconf -vfi
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname}.git"

  install -Dm755 "src/${pkgname}" -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
