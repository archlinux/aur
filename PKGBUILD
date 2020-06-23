# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io
pkgver=2.3.15
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL')
depends=('ffmpeg' 'openimageio' 'seexpr1-2')
source=("${_pkgname}.tar.xz::${url}/releases/download/Natron-${pkgver}/${_pkgname}.tar.xz")
sha512sums=('c5c2dde19f9b2eec4852f217ebded06fdaa5496e0e49a40172d8d14b8c998ed1fa22f361fe4e4ea39b1308d8489ada192e960386913b024033fc78752ae18425')

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
