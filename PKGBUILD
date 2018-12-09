# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname='grapebite'
pkgname='grapebite-git'
pkgver=r2.dfd0e53
pkgrel=1
pkgdesc='Scripts for managing Windows games under Arch'
url='https://github.com/vanyasem/grapebite'
arch=('any')
makedepents=(git)
depends=(wine winetricks)
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
  ln -s "/opt/${_pkgname}/BattleNet.sh" "${pkgdir}/usr/bin/BattleNet"
  ln -s "/opt/${_pkgname}/GTAV.sh" "${pkgdir}/usr/bin/GTAV"
  ln -s "/opt/${_pkgname}/Origin.sh" "${pkgdir}/usr/bin/Origin"
  ln -s "/opt/${_pkgname}/SAMP.sh" "${pkgdir}/usr/bin/SAMP"
  ln -s "/opt/${_pkgname}/Steam.sh" "${pkgdir}/usr/bin/Steam"
  ln -s "/opt/${_pkgname}/WOT.sh" "${pkgdir}/usr/bin/WOT"
}
