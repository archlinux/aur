# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="foone"
_repo="SierraDeathGenerator"
_appname="io.github.${_namespace}.${_repo}.png"
_pkgbase="sierra-death-generator"
_pkgname="${_pkgbase}"
pkgname="${_pkgbase}-git"
pkgver=0.1
pkgrel=1
pkgdesc="Creates 'game over' pictures."
arch=('any')
_url="ssh://git@127.0.0.1:/home/git/${_repo}"
url="https://github.com/${_namespace}/${_repo}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=()
makedepends=('git'
             )
license=("AGPL3")
source=( "${_pkgname}::git+${url}" )
         # "${_pkgname}::git+${_url}")
sha256sums=("SKIP")

package() {
  local _icon_path="${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  local _launcher_path="${pkgdir}/usr/share/applications"
  mkdir -p "${_icon_path}"
  mkdir -p "${_launcher_path}"
  cp "${_appname}.png" "${_icon_path}"
  cp "launcher.desktop" "${_launcher_path}/${_appname}.desktop"
  cp -r "${_pkgbase}" "${pkgdir}/usr/share"
}
