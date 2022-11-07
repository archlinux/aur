# shellcheck disable=SC2034
_uuid="indianaVGA"
_app_id="com.lucasarts.IndianaJonesAndTheLastCrusade"
_title="Indiana Jones and the Last Crusade - The Graphic Adventure"
_suffix="(FM-Towns, Italian)"
pkgbase="indiana-jones-and-the-last-crusade"
pkgname=("${pkgbase}" "${pkgbase}-it")
pkgver=1.0
pkgrel=1
pkgdesc="LucasArts 1989 videogame."
arch=('any')
url="https://en.wikipedia.org/wiki/The_Secret_of_Monkey_Island"
depends=('scummvm')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}-it.7z::https://archive.org/download/scummvmitalian_202103/Indiana%20Jones%20and%20the%20Last%20Crusade%20-%20The%20Graphic%20Adventure%20%28FM-Towns%2C%20Italian%29.7z"
        "${_app_id}.desktop"
        "${_app_id}.png::https://www.mobygames.com/images/covers/l/29986-indiana-jones-and-the-last-crusade-the-graphic-adventure-dos-front-cover.jpg")
sha256sums=("63f2ea098d441e18e5267b07274a13c3ad7d80bb3440a8694f9defe3e8f33b57"
	    "49dc20a0c2bd2afd42ed66bdeab64847759f32d7fcbabe1b3b34ff36a96bf4a8"
	    "6d35c55ddc136393da84867eccb254f3152ba78fb21b08291c3a224f2f66af3b")

# shellcheck disable=SC2154
package_indiana-jones-and-the-last-crusade() {
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}

# shellcheck disable=SC2154
package_indiana-jones-and-the-last-crusade-it() {
  depends=("${pkgbase}")
  local _game="${pkgdir}/usr/games/${_app_id}/it"
  mkdir -p "${_game}"
  cp -r "${_title} ${_suffix}"/* "${_game}"
}
