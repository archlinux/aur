# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-de4
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A German male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/de4.movies.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/de4.tourdefrance.pho")
sha256sums=('78c988d6df3948df369aa5c0d13a2e3668b7a42d0f5e4f0e21d31523f61e502a'
            '334d9da6f1175c230782053016a64a4b18bf4367416ea96b4b20b9d01b919613'
            'cd6d9e583e6a949bef4e0c01b1e36ad3ce4fd2bb431608644e8a241862937a07'
            '15ecfbddc10bd4271bb25c2aa42ea919cd90ca40b4cbbbdefe4be284edc0ed63'
            '6519bde1baba81665e36ad19d0a1448bb07e959b7015fa588838f35faf2fd289'
            '6ce43769375709c721a8abc19062b68ba6c4bb133e8e49d5c6f6f185f5ac3691')

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
    mbroli.ini de4.movies.pho de4.tourdefrance.pho
}
