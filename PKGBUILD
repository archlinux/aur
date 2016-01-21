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
sha256sums=('d75d795dbd2a5025ead25954d1d0a55f083e8381173f94a2f7665811b9192dfa')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"*

  autoreconf -vfi
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"*

  install -D "src/${pkgname}" -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
