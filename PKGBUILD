_uuid="SCUS-94900"
_app_id="com.naughtydog.CrashBandicootPrototype"
pkgname=crash-bandicoot-prototype
pkgver=1.0
pkgrel=1
pkgdesc="A prototype of Crash Bandicoot for the PlayStation."
arch=('any')
url="https://hiddenpalace.org/Crash_Bandicoot_(Apr_8,_1996_prototype)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.tar.bz::https://files.hiddenpalace.org/0/04/Crash_bandicoot_1_prototype.tar.bz2"
	"${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("67e051a225b62b37b6adec5079a612f33d8cc2f2cd8f5a6550fa41dec2eb1de0"
	    "85fc6ae9eec584a81a8eed657df3f2520b5ce0d1be113a34787c130262b12e3d"
	    "d0f67dc5a09b76181d490d1e03b611b366af9b61dacaf7ed5d665f813f96842a")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  local _name="crash"
  install -Dm755 "${_name}.img" "${_game}/${_uuid}.img"
  install -Dm755 "${_name}.sub" "${_game}/${_uuid}.sub"
  install -Dm755 "${_name}.ccd" "${_game}/${_uuid}.ccd"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
