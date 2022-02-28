_uuid="SCUS-94426"
_app_id="com.naughtydog.CrashTeamRacing"
pkgname=crash-team-racing
pkgver=1.0
pkgrel=1
pkgdesc="Crash Bandicoot Racing PlayStation game."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Team_Racing"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.zip/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.zip/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.cue"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("f780bf2331476aabfc00772fa758b12dd95ebfbc907968132cbd3cdd4e2c07c0"
	    "5bac7f02de7b8fb081e1049f4a277be1062c83fcb7ac6c98308ba7985280e4c3"
	    "f1064a7333efe59f2789208c0bcb72a40ba317bc3dfe71162362f599bbb8bbce"
	    "106098626e086b5de9be839df3c55fb953633a8add198b4720a41fee6f649751")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
