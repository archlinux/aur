# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-en1
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A British English male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/en1mrpa"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/euler.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/eulerfr.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrolamr.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tobe.pho")
sha256sums=('edb8eaae6f0e38493d88ed627518632e6ff8a3843bcf08474a1a70aa786fd99f'
            'c48496ced464afeb65030cb142246a5b6992b03ee5ef4932b9445660dd47c744'
            '35f0b77f4b84638a89c74be5a8a270ad4cf417af73bbb3e847c465095c699931'
            'c0ec3576abb2c699764ee55e57bab8b40c825b925d9fb14e187fc9aa4d5d1c68'
            'e9e9841a5f48a9bb6e6099c5594abee04c9274860061f75018e5f8de1acec98b'
            '8648210d765aa5cb82022e8965808ebaf646a4c915d1e19f236977f066eacb9a'
            '938895ece985236c2e41749a58284f0f4ce4be518dc29c902a70400e3a8805bc'
            '8998edd47a1bbe50f8b255713cb1dbd0387bcad06208ee14998a58dd40e82e37'
            '40521512827f04d5168e0377438835c9b4ec20b21034e98a110d9801a06a8b73')

package(){
  # Install license file
  install -m 644 -D "README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini euler.pho eulerfr.pho mbrola.pho mbrolamr.pho tobe.pho
}
