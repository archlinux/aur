# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-lt2
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Lithuanian male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/debesud.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/kiekvd.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/polangd.pho")
sha256sums=('855b49a11f962e3e61223f96187f7cbb60844c52748d3ebab17cb0a0ea2b0062'
            'c906047a0bbf8c1c51fae8347f472833a73c6ab88f4b62dcecb1a73a1d2802d3'
            'ba85289431ab0090b94c9ceedf62f513494656190e5f8f3ffc46953a4c8257f5'
            '1b015848f8d7335f24a8825a18822055b1105a12953279c7656099161bec2c00'
            '270d5ba1241ac93f3198d537670aaa1ce6edc996f754c10479bc30cb059be781'
            '496d2826b3c14f3cd89ed29223786bc17e47f105d6e60f0dd23682bf5cd18c3f'
            '2e3f7d10a10dd69e7c369c88ae05ab81ab02d5368225038ea9c980843e7c06f6')

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
    mbroli.ini debesud.pho kiekvd.pho polangd.pho
}
