# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena
pkgver=2.3.15
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL')
depends=('libcdr' 'libgl' 'libmagick' 'librsvg' 'libxt' 'libzip' 'opencolorio' 'poppler-glib' 'sox')
makedepends=('openmp' 'pango')
source=("${_pkgname}.tar.xz::${url}/releases/download/Natron-${pkgver}/${_pkgname}.tar.xz")
sha512sums=('d115a4d5bd96dc01e7af3337510b4cf69f8e1e7a69269f068ae07c300782c8dae78a38b3ad11bceda15a7f555e9a522bd499442362650aa326aaa752cc1fe915')

build() {
  cd "${srcdir}/${_pkgname}"
  make CONFIG=release
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release
}
