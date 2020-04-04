# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-nl1
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A small Dutch male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/1-10.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/11-20.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/21-30.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/888.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/dialog.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/phone.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/singing.pho")
sha256sums=('f31c29fcb59101aad91c12aaf8c02e88d1ef1f712e64c387193fff4686a6e2d9'
            '59a9f585e261cea781a35f121eeefcecd876c9d522d36f64adfb2253f6640633'
            'cdd169178370ef13a68b7a598913364627cf250a74419e1686f7324ac49a62bc'
            '41d711ec17ab1bed5e0910bd44b8a09b472d88abe739b08da9773d63ec68e1bb'
            '1bb94b2dd5db5a33023d810aad675256bd0f3bd15b3be07bc81fd618e8eb15cf'
            '818349e0b3008571405dd08cec8bb5848e47c4172f7ef0c34479abcdde03cf11'
            '897dae25dfda3e433c3a7bc87a2a048c7d6431767bb3a412dafb1ca420f8033d'
            '66f71d76c543e95a16e3d6f9c02cc75bc19dd53e97ecf50ed5363b6e51c8959a'
            '612d0ddb2ca13158513374cfe27d9788cc972aaf8e9aa730773d5f31a4849242'
            '9d34b541e26657d8d316cbea3f45c282ce3d3ad2da30fe41d559654eff053270'
            '7e620582ae054214e87ec4c5f846064233614c89a9fcafa7cf15b5706b0e9fd0')

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
    mbroli.ini 1-10.pho 21-30.pho 888.pho dialog.pho phone.pho singing.pho
}
