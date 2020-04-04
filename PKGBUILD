# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-jp2
pkgver=15.6fa9693
pkgrel=1
epoch=1
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/kon1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/oha1.pho")
sha256sums=('c6ee2980507c2e7b6bf6c9b5f401e4bde5b4e30a611f82360934279089278df1'
            '9cbe97381a349870193a9d7115678b15d473c2dd23c0d5c602b46e868c4932e1'
            'aa03f0889c18cf247f1dbeb38136979692a98dcc4312d9dfdf62b6cd2dcdca7c'
            'd70d975780edd9c47679daf24c24925d32aee4e8e9d6d6391a66f03b9547dd29'
            '83e78a159fa7377f884cb4d92b0db7e5aae2d0d64879b7794ce98e82c983034d')

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
    kon1.pho oha1.pho
}
