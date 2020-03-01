# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-de6
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/english.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/erzaehl.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/french.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hoerzu.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/kennen.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/spanish.pho")
sha256sums=('7c2e7d36b19e9461f28efe531fcd0aade1c4e704b5e2718416b23d9800ef5a88'
            '70cb0b2cd68780f6cfdb3dd6d14e4e5ef689ee3f1f7b594a6c1bb1ecfff013db'
            '663007569fd8566dedf1bb648d81a42a9277e13ed7aa0ec4cd0c1a11a5cb231f'
            'd6ce458afd19c655e4f3e90365848e8352267998f17db64b9b9c6a2fda36c71a'
            'b00d22aa49790bf2ed4806898f998978d1bae5e4b799d2127639090432ffae02'
            '3ab3a71a0367eba5007d25d6d9b32707846c47ddb1d8304311b2decf2be4bc80'
            'c2f08dea648d7502e944590ac230173a293632343c6142ad18200f91e03fb64b'
            '3235cf11e8c130f34fa24a4152e8f11dd08e9d60005691d05d7d3ff5c08fa5a9'
            '58fbd949e80d3d27f7073bf45ee9bc0201e01460b1dc67a28ad55d2af03419ca'
            '1964e97603df7d87cc0b3e0384754613fe320b7ec687d62ff95c528042dbfe02')

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
    mbroli.ini english.pho erzaehl.pho french.pho hoerzu.pho kennen.pho spanish.pho
}
