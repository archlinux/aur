# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-nl3
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Dutch female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hagel.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hoort.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/kat.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/spengi.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/weltrusten.pho")
sha256sums=('7cb2769500efc33563d82c7ee8162bc7cf174d3b75c750e2f4f3740bc9e26ba2'
            'f97ae0a389c15c5acc3e353371185b5be77f5cdf5194ac383a34f51a78b2f0d3'
            'e3c3bb069fe70a95136da6472b3cbd4bda93b9594f9deed270af46ad658d743a'
            '725733a11705a2d2ffed1b54d3bada74ee72a2e2a67a64d7062305953ba93256'
            'fc193d726f48836b7a02edbaa34d1b274a11fa75519b285ec667f9fb442f5b5b'
            'a23b04df0c69a89fd4ef0dd06e920445883110537e48de31b7cf87b970e76219'
            '23922007f181be1e1ed3c4b1e31e160b429f2e32358178b25f096c3c5378b7ed'
            'e79d6d47d8afcdf4c08643d1184bdcea2f6cff710f633bb264648d3a96b28114'
            '63fa4e3ea1a4afc7d0503ed6ec4031559a6b8966ecc8c5006c8b9f287a572287')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini hagel.pho hoort.pho kat.pho spengi.pho weltrusten.pho
}
