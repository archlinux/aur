# Maintainer: enricostn <enricostn at gmail dot com>

pkgname=dott
pkgver="20161228"
pkgrel=1
epoch=
pkgdesc="Day of the Tentacle Remastered"
arch=('i686' 'x86_64')
url="http://dott.doublefine.com"
license=('unknown')
groups=('games')
depends_i686=('mesa-libgl' 'alsa-lib')
depends_x86_64=('lib32-mesa-libgl' 'lib32-alsa-lib' 'lib32-libudev0-shim')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog="${pkgname}.changelog"
_archivename="DayOfTheTentacle_Linux_NoSteam_v1.4.1"
source=("local://${_archivename}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.changelog")
noextract=("${_archivename}.tar.gz")
md5sums=('667b2a8a082702832242321515e55e70')
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  tar zxvf "${source}" -C "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Dott" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
