# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=mbrola-voices-cz2
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Czech male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/jednach_niz.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/Test/musimrict_niz.pho")
sha256sums=('23f78d232781ce0785fbe1a7549efabc44b92fe7a64f8f2bff0d9aa743455d1f'
            '10c60ab223752776e41e9dac1817f8bb791a0454ed83de76b6544033371446ea'
            'd63b1b1e6ef5f251c3044410fc2aa46f8fa7372a60c8f49092cd73785f0380dd'
            'b2dbb9531b3aa5eafd112b4a32b7887c87ec46a3918c56f9363c108424f79f51'
            '9006d041e71b922b947ce84b0fea01e2ffe80d1c86b4d9f1c7913b74f49a5e54')

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
    jednach_niz.pho musimrict_niz.pho
}
