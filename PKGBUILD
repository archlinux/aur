# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname='grapebite'
pkgname='grapebite-git'
pkgver=r6.2a701aa
pkgrel=1
pkgdesc='Scripts for managing Windows games under Arch'
url='https://github.com/vanyasem/grapebite'
arch=('any')
makedepents=(git)
depends=(wine winetricks dxvk-win64-bin dxvk-win32-bin wget)
source=('git://github.com/vanyasem/grapebite')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  cp -ra "${_pkgname}" "${pkgdir}/opt/"
  ln -s "/opt/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/opt/${_pkgname}/BattleNet.sh" "${pkgdir}/usr/bin/battlenet"
  ln -s "/opt/${_pkgname}/GTAV.sh" "${pkgdir}/usr/bin/gtav"
  ln -s "/opt/${_pkgname}/Origin.sh" "${pkgdir}/usr/bin/origin"
  ln -s "/opt/${_pkgname}/SAMP.sh" "${pkgdir}/usr/bin/samp"
  ln -s "/opt/${_pkgname}/Steam.sh" "${pkgdir}/usr/bin/steam-wine"
  ln -s "/opt/${_pkgname}/WOT.sh" "${pkgdir}/usr/bin/wot"
}
