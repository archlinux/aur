# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-ca1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Canadian French male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/licence.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/bottine.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/ginette.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/merci.pho")
sha256sums=('dd2d1ecb4e8a08a1bedfc9429e91aa50b9352772ad35de86acf495fbf03db69a'
            'b3644eb2e456009db2c302e6bae3434db292dcc08bfa350ec8efe6ae277b8a89'
            'f1a1e19fe41b69a10085318704f32a96baf80cd806d4f0fbd25a05765979d9f8'
            '452ea450a79e596520faea3defe5090c9d4bf65c3994e025d88f5f1770a35765'
            'f9ca49e57274618d9d2a6ecc09848d23b1a019210caed805bcaed6ed22b72335'
            'ba955e1f4f24091250868f60456a795582b1f48b9f8cd3b02c1e8d606666a85d'
            '04b12af831e08d5e05aa489b3b2aa7050770afc6fa743a79211ad6f98c68b944')

package(){
  # Install license file
  install -m 644 -D "licence.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini bottine.pho ginette.pho merci.pho
}
