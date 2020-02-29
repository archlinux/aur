# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-br4
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Brazilian Portoguese male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/como_como.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/music.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tabela_de_notas.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/test.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/diphones_complete_listing.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/readme.txt")
sha256sums=('c93fa66ebfab790bc255cb77499e7eca055ac1216df0f336fdcc2037c4271bbc'
            '1d66e17556fd8b4d414904dd94efbef45e228b8429c61514f85e7299d908a11d'
            '04bd516b8f998800e1811fa5fd4abb1956034ec5177185cfd6c9eb480bf208cc'
            '016592ee6e9a86a4b6f2fb1cfd24ea47a83591f93ca1e4790a31f2cdc07433b7'
            'ef0025e913ceda1516fc04ccf4e403ed25be117a042e275880e51c105bde9dfa'
            '0839ed23b01a6f7fa1ebddf860f9c309a48f7619a2f71f78fbfb904139ebf1bf'
            'e91b94916f0248ad48c09b2a54f041a038c04057e8b346661b496fa5aeaee4f0'
            'f98ca8b32e64d776e6532cec37fd3135fa132d1c9f218013f05d7d6a69fbd2c9'
            '32df6d8f653081839412395c45d582c701763c513c5140b9b0d40448ce76e3fa'
            '61c90d0e3773245d12b0164848ce4f7beb886d2d9d8a1352e095c2fc277e9eb7')

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
    mbroli.ini como_como.pho music.pho tabela_de_notas.pho test.pho \
    diphones_complete_listing.txt readme.txt
}
