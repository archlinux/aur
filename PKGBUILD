# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pidgin-indicator
pkgver=1.0.2
pkgrel=1
pkgdesc='AppIndicator/KStatusNotifierItem Plugin for Pidgin'
arch=('i686' 'x86_64')
url='https://github.com/philipl/pidgin-indicator'
license=('GPL-2.0-or-later')
depends=('pidgin' 'libayatana-appindicator')
makedepends=('intltool')
install=pidgin-indicator.install
source=(${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('d855be9c98927cdce65c320ebadd4cc08d3efc6881d22f32c2f654472fc1c021')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
