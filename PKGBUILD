# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-de2
epoch=1
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/lautern.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tts.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/wetter.pho")
sha256sums=('5fb968f9b5a8fe594958d4a8b77c388c38c39f9a855d08aba4d500c62f899be1'
            '909da902c3ce5bf10aaa252842760105c9696b095679fc075614da5c9a95a882'
            '36e9dbfdfc3f222e138b1c1d10283f26d6738a4dcf38d0ffb0a0d8997eedc271'
            '0f6bc801c50d93fa1c8def8dd490bd38ab2e8b565c22b39a86505dfaea60f0de'
            '4e6a5c6cfcbe68b91b3123ebe6dacd00ed5b48ebf7da055a106e93fe8fd83eef'
            '7d8e1bcbf891698f87133e16b56705452dab4217705906066eeb6cbb1e273fda'
            'afe585da7cee42d94eb7eb446c12720377d2e95f808418de0d51f87fb40a471b')

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
    mbroli.ini lautern.pho tts.pho wetter.pho
}
