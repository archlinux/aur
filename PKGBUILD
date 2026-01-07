# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_lang=kr
_filename='LINE_Seed_Sans_KR.zip'
_dirprefix="LINE_SeedKR_"
_licepath=""
_fontpath="./"

_fname="line-seed-${_lang}"
pkgbase="${_fname}-font"
pkgname=("otf-${_fname}" "ttf-${_fname}")
pkgver=2023.09.06
pkgrel=1
pkgdesc='LINE Seed KR font'
arch=(any)
url='https://seed.line.me'
license=('OFL-1.1-RFN')
source=("https://seed.line.me/src/images/fonts/${_filename}")
sha256sums=('bfc3d5f737a47be1d9fc6cc971d8f78c7b6688f327501b522071f306dcdcf3e1')
b2sums=('b318994d46bad527c2c8c6ee07a447452fea7ef5cb446487e43fce9f3de4db577b52ee6be2d4d6f7578f05776fdd2a8bae67688075b666f514bbe007759f1a8d')

pkgver() {
  local _dir=$(find -maxdepth 1 -mindepth 1 -type d -name "${_dirprefix}*" -print)
  echo "${_dir#./${_dirprefix}}"
}

package_otf-line-seed-kr() {
  pkgdesc+=' (OTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}OTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.otf
}

package_ttf-line-seed-kr() {
  pkgdesc+=' (TTF)'
  cd "${_dirprefix}${pkgver}"
  [ -f "${_licepath}" ] && install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licepath}"
  cd "${_fontpath}TTF"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
