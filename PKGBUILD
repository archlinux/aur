# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-us1
epoch=1
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="An American English female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/us1mrpa"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/alice.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/push.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/xmas.pho")
sha256sums=('9f1cd90de6334f43cb4f7348cacd0806fb414b0fbc762492bde7000b9e192a9a'
            'b4906370ac6a06c7b2dca3e7c2de7c65e057af69e9bcfd4fc40b93c861e8b376'
            'a3ee173369df15511b876d46c7909a36bbc3c565e2978caa6c249dee6df187e3'
            '9d5e5f3f026fec11b1757652631c0e64b12a8d081b4a76268c83e70f1884849a'
            '42cb839e1b8de0da8b55a8aa8b2c5906dc1ef8811a84f57d971002e584699545'
            '24aa9edc403b7ffc8af21d695a57b12d4118b8bdc59053c85d1085e80f8f1660'
            '858f0242c3f8ea937353d5e52b95ebe73c9763070e295ce9492c448c7b3ed57f'
            '494d22a8fc68baf4fbeb474262aabd290ac08ade55287f16730cc0dcf92ea090'
            '7d0f2541bbc32825b81d4efdd2ab54d87ebe6cf1b707c2fb4d7ecad79315c47d')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" us1mrpa README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/test"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/test" \
    mbroli.ini alice.pho mbrola.pho push.pho xmas.pho
}
