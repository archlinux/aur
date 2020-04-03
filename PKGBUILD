# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-fr4
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/kundera.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mbrola.pho")
sha256sums=('0c0a916fc32382a8b1f252fdc5c269a2c8dcb8b440971b9bd1960c02b7cb0c93'
            '6a8cce60ff27a083cf636286187acec1ffc9ecc80a61e1af97a6e5b6d19f0bcc'
            'e8f3f57efeb9f093d32612166d768d5c404d7f2cbfc6217972249657ed69efe5'
            '1a059407b03fbba0f365669fc9caed72223188d20993be671c33c30ecbffe016'
            'beaaba55346d3bb8764ce7fe4d0f439339d6598904a676232810227c05aa4c61'
            'a7b2314f328ac53915f12afe32deb9e9bd058a7baa4de82fd4d08f62c13e24cd'
            '5ecfdb9645eda13fa1dde01332ce008090faf78bda2c543c152d015d1d57b953'
            '29639acd19b5fc3574e369c1c9449f78675a4d015b76e5a002cc4fb838dd8dd1')

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
    mbroli.ini bonjour.pho hier.pho kundera.pho mbrola.pho
}
