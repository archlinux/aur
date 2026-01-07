# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_lang=th
_filename='LINE_Seed_Sans_TH.zip'
_dirprefix="LINE_Seed_Sans_TH_"
_licepath=""
_fontpath="./Desktop/"

_fname="line-seed-${_lang}"
pkgbase="${_fname}-font"
pkgname=("otf-${_fname}" "ttf-${_fname}")
pkgver=V1.003
pkgrel=1
pkgdesc='LINE Seed TH font'
arch=(any)
url='https://seed.line.me'
license=('OFL-1.1-RFN')
source=("https://seed.line.me/src/images/fonts/${_filename}")
sha256sums=('9ec666c8b0a325bb24c749cc17bee8dd76ab718a5ca78f8a22930d3d4a60778d')
b2sums=('5b40fc04094cc2e373261d5fca06009613cf95213c8bdf22f9857d2df123521a7ac7e3c1f8875b1b2a6df75c3e5a6ca2fd41c01401af183b91fdec7c2311b972')

pkgver() {
  local _dir=$(find -maxdepth 1 -mindepth 1 -type d -name "${_dirprefix}*" -print)
  echo "${_dir#./${_dirprefix}}"
}

package_otf-line-seed-th() {
  pkgdesc+=' (OTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}OTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.otf
}

package_ttf-line-seed-th() {
  pkgdesc+=' (TTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}TTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
