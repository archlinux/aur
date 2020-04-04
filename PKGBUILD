# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-sw1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Swedish male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/lukas.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/lukas2.pho")
sha256sums=('0bcb8c5b5af25cf6d5da97dbadcc7658f009652ab207793f9fda2b0d22c61fd7'
            '178ff1c90dda02d55d63ac045ba31abffe7405cc8ea3ef9620f66460f05cdd21'
            '2cdbc2217a1a0c238eae6705026ca8e29a81a123db5ebbd2c024a690bbd1d6f4'
            'cfe2f9be4da37fe0fdc861647a4da2a86eff5629938abe5e2cef9d0b171225c3'
            '9994585a4a1d07eb59ab0049702ce66d45f9d8cdbb374b0d45b9a3329659413f'
            'cb6b2c2566ab69bf1775078226f6b26fa4c4345c2775b5e4e6e40f7fa562ad88')

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
    mbroli.ini lukas.pho lukas2.pho
}
