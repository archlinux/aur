# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-de3
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A German female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/de3test.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/de3tts.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/demo.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/wetter.pho")
sha256sums=('480ed66b78b22aebdfe9cc82af078edbd53525efe793bfc22ef6d1047fa48f61'
            '745570e7944a242171c41b24680eedb7457fdd66e91a7065ce9f3f5fd24a368c'
            '0354efc104aa2a33a6417554e69d02c5153d8469552c277a04bf7de65402f090'
            'e476b21a0a8a73c92be0df386dc061430bd3c11d3433ca18a9d530e7a25e5bb0'
            '6175cf96e73740dfcc01b3ec7c13591a9f6e476d3420204d86af3a355cf1db81'
            '68777df2e446df8d6890fc1109ce606c03b09280494321353a4ad7c7d8aae670'
            '06ae8b5cc9a2e635ad7a8e9b70af7468705028fb45fb9a0607becc606704fd12'
            'bb9608be492f4f2e819b76bf1f15708d8ece75a114e754039149279e6b3af7ab')

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
    mbroli.ini de3test.pho de3tts.pho demo.pho wetter.pho
}
