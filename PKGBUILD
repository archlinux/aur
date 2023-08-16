# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_uuid="samnmax"
_app_id="com.lucasarts.SamAndMaxHitTheRoad"
pkgbase=sam-and-max-hit-the-road
pkgname=(
  "${pkgbase}-mt32-en"
)
pkgver=1.0
pkgrel=1
pkgdesc="LucasArts 1993 videogame (MT-32 soundfont)."
arch=('any')
url="https://en.wikipedia.org/wiki/Sam_%26_Max_Hit_the_Road"
depends=('scummvm')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
_archive_url="https://archive.org/download/samnmaxmt32"
source=(
  "${_archive_url}/MT32_CONTROL.ROM"
  "${_archive_url}/MT32_PCM.ROM"
  "${_archive_url}/SAMNMAX.00"{0,1}
  "${_archive_url}/monster.sog"
  "${_app_id}.png::${_archive_url}/220px-Sam_%26_Max_Hit_the_Road_artwork.jpg"
  "${_app_id}.desktop"
)
sha256sums=(
  c088c026ad99e13204ac4aa157052f443c52424cbd6394a82abd60bab4c34b91
  d9164063f293410cf33f2f64cdcea6893b44723fe41938e07ec9aef58b406238
  2cd123fe1de4ab729193dbdbdea5a6c016bff35a295d0331a9f7feead131a106
  6259d09d4ad5bf1efdb70506ccfcabca52ba79c268a08fde06900ab523a9eb38
  4bc00d1a7e35bc293085034240289fc609025f0128365734debacadd3f625d63
  476304ea0a4d850d7bc7cb0d3b9f0b4cb623424c184c22ee95cc86cee9466ac7
  11d0850717bd4535f8f0f8c360c03191037490185c91b0a4da438a5bd3a55846
)

prepare() {
  cd "${srcdir}"
}

package_sam-and-max-hit-the-road-mt32-en() {
  local _applications="${pkgdir}/usr/share/applications"
  local _icons="${pkgdir}/usr/share/icons"
  local _game="${pkgdir}/usr/games/${_app_id}/mt32/en"
 
  provides+=(
    "${pkgbase}"
  )

  mkdir -p "${_game}"
  install -Dm 644 MT32*ROM "${_game}"
  install -Dm 644 SAMNMAX.00{0,1} "${_game}"
  install -Dm 644 monster.sog "${_game}/MONSTER.SOU"

  install -Dm755 "${_app_id}.desktop" \
                 "${_applications}/${_app_id}.desktop"
  install -Dm755 "${_app_id}.png" \
                 "${_icons}/${_app_id}.png"
}
