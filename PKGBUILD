# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="foone"
_repo="SierraDeathGenerator"
_appname="io.github.${_namespace}.${_repo}"
_pkgbase="sierra-death-generator"
_pkgname="${_pkgbase}"
pkgname="${_pkgbase}"
pkgver=0.1
pkgrel=1
pkgdesc="Creates 'game over' pictures."
arch=('any')
_url="ssh://git@127.0.0.1:/home/git/${_repo}"
url="https://github.com/${_namespace}/${_repo}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("nodejs-serve")
makedepends=('git')
license=("GPL3")
_commit="68a811dc040a796069a407f533b34477c34da220"
source=("${_pkgname}::git+${url}#commit=${_commit}" 
        # "${_pkgname}::git+${_url}"
        "${_appname}.png"
        "launcher.desktop")
sha256sums=("SKIP"
            "73435fe2ed45016778b19787855bedb904130e99516fc2769ecdab627c3b9690"
            "SKIP")

package() {
  local _icon_path="${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  local _launcher_path="${pkgdir}/usr/share/applications"
  mkdir -p "${_icon_path}"
  mkdir -p "${_launcher_path}"
  cp "${_appname}.png" "${_icon_path}"
  cp "launcher.desktop" "${_launcher_path}/${_appname}.desktop"
  cp -r "${_pkgbase}" "${pkgdir}/usr/share"
}
