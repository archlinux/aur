# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-us3
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An American English male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/cslu.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/diphone.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mike.pho")
sha256sums=('7cc5c49e098f80091e34ed0bd50f0af3908ac2427fbbe7d2b16c57defb7611ec'
            'bb8bfe001e96f1215c941b064d3db0956d24c5804d3717a4dbaea5bdd33135c5'
            '2c90316819d7769168d33371232feb2a6f48099bcbb2ca4e9e052d6d82786f65'
            '78e1bdd56ad94fa6d24eb653da5625c90a02fa88703c6130bfb865d9b0a6e69d'
            '285f4ed0fe5dd4ce4b966885e6dce2f6766c9213366209d4a9fbb274fa288cf6'
            '781c29813d557a920b2b75ca6e1238b747a5df14b300fd602eacc706ffc36333'
            'de865bffa8f9b86bb7301713aa9bcea93e7bb8b06d765977347d8d7ccc66ffeb')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini cslu.pho diphone.pho mike.pho
}
