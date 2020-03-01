# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-us2
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/alice.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/babel.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho")
sha256sums=('75f7f6b605945f4b65713c3ad1fba5be38fb720cde01bdc3d2facf988634c0d5'
            '6faf2ba98c85bad28ebc33bfd1c65368c4bdc99ecea40b8e7bc1f7e891ce5b78'
            '3f902481587fa2c83837935dc8112081b4520ef245c34e773b4ffb1663212cfb'
            '46dba6c94b8c2d812703f65dc8f94385bc404010442e98b10dd18b4f030a2fc6'
            '37dd7c6fb5b8fbbfa80fb95e3a21dbfb555f4231e2772b3aa9fc05c43a9e31b5'
            'ad62fa19308735e21e1dad411b286001f3d359684f4c1dbc3e54c547cc9b7702'
            'b7b94eba1e0d947095ac2daa9b1e21664169714814f9bb4cabbd724b9c7580f4')

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
    mbroli.ini alice.pho babel.pho mbrola.pho
}
