# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_lang=en
_filename='LINE_Seed_Sans_EN.zip'
_dirprefix="LINE_Seed_Sans_"
_licepath=""
_fontpath="./Desktop/"

_fname="line-seed-${_lang}"
pkgbase="${_fname}-font"
pkgname=("otf-${_fname}" "ttf-${_fname}")
pkgver=V1.003
pkgrel=1
pkgdesc='LINE Seed TW font'
arch=(any)
url='https://seed.line.me'
license=('OFL-1.1-RFN')
source=("https://seed.line.me/src/images/fonts/${_filename}")
sha256sums=('ef6483b1a0aa60c9c1f222f18a3c0e43d3c01413a3c945a5273b908f07df33e0')
b2sums=('7b5f4ac4464974a8fdab5bb0057e98f1b582217f15d57ffff0bed1e7569aa18e1aa04c35a8531751c7431d75481a1c98750a6c456eee97c95199fd541ab7d74d')

pkgver() {
  local _dir=$(find -maxdepth 1 -mindepth 1 -type d -name "${_dirprefix}*" -print)
  echo "${_dir#./${_dirprefix}}"
}

package_otf-line-seed-en() {
  pkgdesc+=' (OTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}OTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.otf
}

package_ttf-line-seed-en() {
  pkgdesc+=' (TTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}TTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
