# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ian Denhardt <ian at zenhack dot net>

pkgname=keyringer
pkgver=0.5.6
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.pw"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('955b7ee1c5d60e624da56b4f7eb18e26e773107cee0f88d75195df65b28ac67a'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # apparently keyringer looks for /usr/share/keyringer for some things
  ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
}
