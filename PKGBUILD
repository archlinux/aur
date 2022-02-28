_uuid="monkeyEGA"
_app_id="com.lucasarts.TheSecretOfMonkeyIsland"
pkgname=the-secret-of-monkey-island
pkgver=1.0
pkgrel=1
pkgdesc="LucasArts 1991 videogame."
arch=('any')
url="https://en.wikipedia.org/wiki/The_Secret_of_Monkey_Island"
depends=('scummvm')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}-it.tar.xz::https://archive.org/download/${_uuid}.tar/${_uuid}.tar.xz"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("2f0653859c685d0c11f606de08821161d72b782fb6f1d03f2d28be09ebd45ec3"
	    "d36b6bdd6ca455f3c5b25cde51c9e892d8757666adaf902081ff21038cec2b34"
	    "a7ecf1b2a0b779e8bc086ee842db5241558187a369739b46eba8c9aa22db440c")

package() {
  local _game="${pkgdir}/usr/games/${_app_id}/it"
  mkdir "${_uuid}-it"
  mv *LFL "${_uuid}-it"
  mv *LEC "${_uuid}-it"
  mv *DOC "${_uuid}-it"
  mv *EXE "${_uuid}-it"
  mkdir -p "${_game}"
  cp -a "${_uuid}-it"/* "${_game}"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
