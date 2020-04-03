# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-it2
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An Italian female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/euler.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/sent1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/sent2.pho")
sha256sums=('48eeeb13c93f2a1487a710d232cd11e65187e4a74c3cb9f6d5cb1085ef50bfdd'
            'a5aef749ab2d541a37aed2fb1ec49c1ab7084754b714caadc920efa73c17b74e'
            '6a1e2fd8fdc2bd9ecf616c485cdc6159d3ec66298658efb9110bf398f6e88925'
            '3f52702c66bb53d8404a588b3a061eadbc03f78da904e2fcd57219c7fc80bce1'
            '0f19d5962eb3598892d06eae9f6a2e1e049d97930a0a37d2f5f4f7ad300548d1'
            '03ea335f76f573ca4a62b40fbe6bfd46dbdd6f4515d237ee1280f09d04ea90bb'
            '82351a5ae186958f0ed9efde0e8e9bf598661846db3aadc67cf8bed1faecbe9a')

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
    mbroli.ini euler.pho sent1.pho sent2.pho
}
