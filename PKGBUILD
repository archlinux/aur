# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-in1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Hindi male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/1.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/2.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/3.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/4.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/5.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/euler.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hintest.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/test.pho")
sha256sums=('e7a5178af7fac0953c1570dd2d93f85d5ae67cfc272177ed1ca45a7be9d692d4'
            '8bd3d6e228c0558c25f98679376d5d1ec3fc3b8c1031ba9a1ba93085aa1df3d5'
            '91181650f0f490399249af58ae23041e62f4d26f02e3ea5a46ef5942b39203dc'
            'c8f837c7eb2debd34bf70ba0f7a3c116288e80d334cc9464967c7c8e7db57785'
            '1bb3fbc40dbf7b8089327e807bfa18cec1c242a6fa6b4495b62a51cf02f86a23'
            'bf498a0dc6b5ef85886eb690f2b6a4f5cffc54ebd55f7c144f5f2a25fcc9f05c'
            '1c890059209e4c48ed05473762c3c2d61e9de8766d4f34683acb80e371f3656f'
            '3956b353ea9608ea44dbaf8bd72d1bb3e2f9183cad13aae8620942b207c36e94'
            'a0c59666ef1b2165099f4e983bf0eec97adeefe6987d59bcdd08f7a88965d9da'
            'db37bd65b77737de54af5bd8144df6be3e3f9a719145dbf8aab227d89287ecec'
            '9265995f993130ed5f7b793b2d2aac6a4197f8d9b48d4ba9a74aa3fd59af2c6b'
            'aeb9811c42329d7a956e97994c8eaf223332f52c8a9b3e26ea94d6efd5686545')

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
    mbroli.ini 1.pho 2.pho 3.pho 4.pho 5.pho euler.pho hintest.pho test.pho
}
