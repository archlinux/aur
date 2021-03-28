# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gog-laurabow2
pkgver=1.1
pkgrel=1
pkgdesc="Laura Bow 2: The Dagger of Amon Ra"
arch=('x86_64')
url="https://www.gog.com/game/the_dagger_of_amon_ra"
license=('custom')
depends=('scummvm')
makedepends=('innoextract')
source=("local://setup_the_dagger_of_amon_ra_1.1_(20239).exe"
        "local://gog-laurabow2.desktop")
sha256sums=('c2cd79986c33ce186a5e7941b73bdda12a7c7f4c11cdffb8643cc8d194d38f64'
            '853bfd75fc640d0f4fda505d31aa05379ae234af01a5caf48a51b43b4a253016')

prepare() {
  rm -rf "${srcdir}/laurabow2"
  mkdir "${srcdir}/laurabow2"
  cd "${srcdir}/laurabow2"
  innoextract "../setup_the_dagger_of_amon_ra_1.1_(20239).exe"
}

package() {
  mkdir -p "${pkgdir}/opt/gog"
  cp -R "${srcdir}/laurabow2" "${pkgdir}/opt/gog/laurabow2"
  rm -rf "${pkgdir}/opt/gog/laurabow2/scummvm"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp "gog-laurabow2.desktop" "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
