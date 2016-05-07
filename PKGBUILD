# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
# Contributor: markzz <mark dot weiman at markzz dot com>
# Contributor: Philip 'Chais' Abernethy <chais dot z30r at gmail dot com>

# YOU MUST SUPPLY THE SH FILE INCLUDED WITH YOUR HUMBLE PURCHASE

pkgname=hyperlightdrifter
pkgver=2016.04.18
_pkgver=2016-04-18
pkgrel=1
_filename="HyperLightDrifter-DRMFree-Linux-${_pkgver}.sh"
pkgdesc="A 2D action role-playing game (Humble Version)"
arch=('i686' 'x86_64')
url="http://www.heart-machine.com/"
license=('custom')
depends=('libcurl-compat' 'openal' 'libxcursor')
depends_x86_64=('lib32-libcurl-compat' 'lib32-openal' 'lib32-libxcursor')
makedepends=('unzip')
source=("local://${_filename}")
noextract=("${_filename}")
md5sums=('bae67eb8b26eb10389161992f0257c2c')

prepare() {
  # unzip will issue a warning about extra bytes at beginning of file, ignore it
  unzip $_filename -d "${srcdir}/${pkgname}" || true
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mkdir -p "${pkgdir}/usr/bin/"

  install -Dm755 "${srcdir}/${pkgname}/data/x86/HyperLightDrifter.x86" "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/${pkgname}/data/noarch/"* "${pkgdir}/opt/${pkgname}/"

  ln -s "${pkgdir}/opt/${pkgname}/HyperLightDrifter.x86" "${pkgdir}/usr/bin/hyperlightdrifter"
}

# vim:set ts=8 sts=2 sw=2 et:
