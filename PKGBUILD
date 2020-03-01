# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-ca2
pkgver=15.6fa9693
pkgrel=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A Canadian French male voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/apres_la_pluise.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/est-ce_Choeur.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/hier.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/ilsepen_good.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/kundera.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/test/mbrola.pho")
sha256sums=('7ed9450b8ff8db4af3de15356f158b8e1c0cbe1fb7b4be4e4894147068b1089e'
            '33acfea90c59c2df4b00b360c83173dc2663d249d4f8d09dfb58b7d708a9ad5b'
            '286bca345fa83dd9a6e3b76228e2ba132d6c8ec0c6b12ea86a04368dfd375e62'
            '34e24c153f7b040dea7a16ecd0a207726121744eb09a0fb38bb91d70690688e7'
            '6b76a694e5e727a5ea610ecec2473de928f2a1005894a9be15f53906dac505d0'
            '69b7ec606d3a710d0ea82ea735def94d235338b006f81fd92c75ea82f3c1a093'
            '56414ee29eb4fb7daa92a2a6a0058b42de4d344cfff14bff1a441d98182f3119'
            '9b481c206468d5cf4c6c003fca8432dfd47fa1e68f2b239b6c39b92d312e3733'
            '6e609ceceee9f07490977a115791515526f12f15646b8b76f63dc3ee063aebe1'
            '7ba14963f8783e7c459a83918b5564d78351d4c2ae552720d1685a806146a7b9')

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
    mbroli.ini apres_la_pluise.pho est-ce_Choeur.pho hier.pho ilsepen_good.pho kundera.pho mbrola.pho
}
