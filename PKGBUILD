# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-br1
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Brazilian Portuguese male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/br1sampa.set"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/Euler.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/Mbrola.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/Nova.pho")
sha256sums=('cba475ecb25ee0f6af657e6f35460f3e2f102f8c3eafb0e413c9a3501f6a112f'
            'a7b15abe92353aa45b4d7ce5ef39deeafb8da5b36b158d42837054975d2f2887'
            '86241e4ac020243b876c93be7b638a1742ee9432e5b4e06a9dbc6676e5df87c6'
            '9088a23fc4ad926a9271a7b223448a7ac6747f44ab58000dd182aa6bb6de6fd2'
            '8f3a4dbec96a24262bdc9698b4842a8fe9e0085a29dea31ee9dcbb086ed356d3'
            '15e0e50ef13f42b36850d64479c97f98d8e3cde0b9d2bc973976dd3f0f375b11'
            'e758895304b7d6dd119893479a085586fb76032b90ce3a722234e7ef093ee7ee'
            'aeb6e155b3ac15c5c3c62f8e9c92b428ca3517ef54d16508f3e4eeef5ca95b04')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" br1sampa.set README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini Euler.pho Mbrola.pho Nova.pho
}
