# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-bz1
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Breton female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/label.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/aman.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/BREUR.PHO"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/cafe.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/docteur.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/galleg.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho")
sha256sums=('dbe189bca19083e4b988811b504316e37c47142854d42694f681c7436f1811c1'
            '82011c47bcf0f1db92b69dc38a7eda4d28ad8d8630e3e423899c0fd609321767'
            '3373621644fbeed6ca4c020b03ec8598d3e311006eb84967e451b0539fe40ad5'
            '4c2d90da22c8406a0bea2ce2ccae5d653b72a64a4e93a39b736a3356856df26c'
            '9662fe7d35d271651378b6b28f2ddda242167981b72cd46aa6e1d5ccdc7a6408'
            '94d88ed6bbe6dd4282eeb799ed012a84a927855f36a84e5a147041b3adfd979a'
            '1ce13bba12d170469770a799d6be0573956a727a5237b9047a20370d7dc79412'
            'b1c0a7cfbaa74a54ff8f3167468b8fd282c7607c720b41f7a2970330e23d2c72'
            'b704015095795d5beff309e254635891dcae3a418d496c6068e1638e0ec1d7c6'
            '9fbeb76f7d0610c77265e64f8e9175338789906d810be4d5be01282a16cd8f44'
            'c420d8298a31ebca7121bfa2a5e36cbe119c22b62359a70888d65bcf2ae0d1ad')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt label.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini aman.pho BREUR.PHO cafe.pho docteur.pho galleg.pho mbrola.pho
}
