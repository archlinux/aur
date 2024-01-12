# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=what-is-electron

pkgname=(
  'electron-is-electron22'
  'electron-is-electron23'
  'electron-is-electron24'
  'electron-is-electron25'
  'electron-is-electron26'
  'electron-is-electron27'
  'electron-is-electron28'
  'electron-is-electron29'
)

pkgver=0.1.0
pkgrel=1
pkgdesc='Point /usr/bin/electron to any Electron version you like'
arch=('any')
url='https://aur.archlinux.org/pkgbase/what-is-electron'
license=('Apache')
provides=('electron' 'what-is-electron')
conflicts=('what-is-electron')

for _pkgname in "${pkgname[@]}"; do
  _target="${_pkgname#electron-is-}"
  eval 'package_'"${_pkgname}"'() {
    pkgdesc='"'Point /usr/bin/electron to ${_target}'"'
    depends=('"'${_target}'"')

    echo >&2 "Packaging '"${_pkgname}"'"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '"'${_target}'"' "${pkgdir}/usr/bin/electron"
  }'
done
