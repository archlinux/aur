# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ian Denhardt <ian at zenhack dot net>

pkgname=keyringer
pkgver=0.5.7
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.fluxo.info/"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.fluxo.info/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('3819e693b0056d5ccf88c544e64d379d90f48a39e065cc1ca33d5719d633e642'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # apparently keyringer looks for /usr/share/keyringer for some things
  ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
}
