# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-ic1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An Icelandic male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/euler.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/goddag.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/krummi.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/ruta.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/tungut.pho")
sha256sums=('1764451ebe76f5d4f5efa67937bffe63b8b3da142ccda24cc7b7718999da9c13'
            '97aa2370b7084254d2d2768489462aad508245022ccbd0f308ff19a2d575a269'
            '5018bdcc2398196a11a9024b07cc76d37218b4ed92d342e1daf5524a10a9680a'
            'db5a7c93c6ce2af0afb95164f7147c4ff661d143a6997c42401432dd7039a7a0'
            '13b2f6decc235ad0ea9920106f3e727336e0c6e7e70ad275beedda7d30a4aa4c'
            'd1b2df3e895aa65943a2cfa0e3bea55443a44cfcba00c5990ee3591dfa01e26e'
            'fadc6ded590a78939185c5e072074d7aee0c7ade81dff6e7a67b804909b99574'
            '353c89bd8b18bf993aaf6ab340e99d166161a221a30824f9aac3e73511850786'
            'f1b038aa82470eae0f54eb3924597e7285a81f9041e08762d9aebe41da7973be')

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
    mbroli.ini euler.pho goddag.pho krummi.pho ruta.pho tungut.pho
}
