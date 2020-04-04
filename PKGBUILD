# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-jp3
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Japanese female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/jp3.pho")
sha256sums=('d4220ffef85d86ecf8e1c1a9f1a2a3ee57ee85ea5e88b2680e7d0668d82245e6'
            '3d3d0c4a1ceae8de6929ce9ca9a50c6e77e333ec8f7b8ee742b8b9f905fd338c'
            '12b1648283d1871ce462427fe03485dbb9caaf4a7dbde787986489b120363299'
            'aa23d073cd2b4dc1a63b2221d3131d9038b184b7170ae8b25c7a94a8fb3e26e2'
            'b4496848d25ef1ecfa5223a10bb294632b98ae93f8239a57e3a186fec8543d1b')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini jp3.pho
}
