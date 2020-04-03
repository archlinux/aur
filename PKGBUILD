# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-fr2
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A French female voice for the MBROLA synthesizer"
arch=('any')
url="https://github.com/numediart/MBROLA-voices/"
groups=('mbrola-voices')
depends=('mbrola')
license=('custom')
source=("https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/${_pkgfile}"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/license.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/README.txt"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbroli.ini"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/bonjour.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/hier.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/jaiete.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/kundera.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho")
sha256sums=('e6269d53b264f5743091397a37a75587e1f16c6c890fa55b2b5f88c67c100339'
            'c99b0e6ee05d315edf986bf48d6267e6ab134182f98346c416f977d1ed0da0a6'
            '1e2567965338a310a9f773106444a0ba3c0a32005fa52c3635c001053407800c'
            '0daeb0556e911c68b17645ff87d55dca00d776a69710bd07d2854bdb498d514f'
            'e65489cf17ac86c509832ded23878250ce5005839800fa794947e2ddfb727a84'
            'a7b2314f328ac53915f12afe32deb9e9bd058a7baa4de82fd4d08f62c13e24cd'
            '1d0aa6c41c0d0a4d669c829292a5975b97b559d00aa7c13cf604526bbe8467e0'
            '5ecfdb9645eda13fa1dde01332ce008090faf78bda2c543c152d015d1d57b953'
            '29639acd19b5fc3574e369c1c9449f78675a4d015b76e5a002cc4fb838dd8dd1')

package(){
  # Install license file
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini bonjour.pho hier.pho jaiete.pho kundera.pho mbrola.pho
}
