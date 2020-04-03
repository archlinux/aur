# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-fr6
pkgver=15.6fa9693
pkgrel=1
epoch=1
_pkgfile="${pkgname/mbrola-voices-/}"
_commit=6fa9693c09bc98f21a519dd9460340db964bacab
pkgdesc="A French male voice for the MBROLA synthesizer"
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
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ceserait.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/claire.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/coup.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/ileenf.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/jaiete.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/mavoix.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/nouspouv.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/tagada.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/trenet.pho"
        "https://github.com/numediart/MBROLA-voices/raw/${_commit}/data/${_pkgfile}/TEST/xavier.pho")
sha256sums=('9fc122671e752d5e18c5c73f49b6beece999f2836e42aa0d0862777edcd643a2'
            'bc78e48be7fcc973ce2cf99446f42554b85601b9743711d68f4066b2677b786d'
            'ebe61e2c54401d8619fc4d14db92c3a35f4d2b77f838376f2a9e0433e349b6bc'
            '05fc41a3c9f5118d2825b61ec3de2b7dcaa502d16a400377dfd8b15f774b0aa8'
            '13678bfcfbe7cc87d3c2590161f16dcae098c995c9ddf511e24aed95bbb6b60c'
            '619c50c94fe47b24643c6c2aff523ac657195bffd1d9648f9e6dde8436552097'
            'c99ee394ef98e9f132c7b040bb48be81975d8a667db7f03599f8eb17af1b6617'
            '69aaa2dc9ef453d33bf5920a790752cff85dd10f5ed04c82854cbda2fcfe21e2'
            '44a56c3860f2796afed49105d0533e07c8ee9e69a7e26326d26de54939553aff'
            '3c31a8bdc9143ff06568de2c06165d654aec5132a8062d5af490e97b7be9acd3'
            '5687f69ce2e2c5afa6bf34c43f487b01da7ae6d365cf543135d667077a77af64'
            'c4611c1e7b2b58aed7f16defc93b85cbb91d29e3856cd6326172e4acb3191e25'
            '8988c2702321a715a94856785cce69e464565feb7679de2187ac10100a0b1699'
            '50b7f2cd0946bda968a3238e7d424352576f92b13c34bd20b3602a3509a2d9d9'
            'e8e5ecdf7d477dd26af044b7a3fcfd19e4a36ecf7f1b350a37264af12d8659d4')

package(){
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../mbrola/${_pkgfile}/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}" \
    "${_pkgfile}" README.txt
  # Install test files
  install -m 755 -d "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST"
  install -m 644 -t "${pkgdir}/usr/share/mbrola/${_pkgfile}/TEST" \
    mbroli.ini bonjour.pho ceserait.pho claire.pho coup.pho ileenf.pho \
    jaiete.pho mavoix.pho nouspouv.pho tagada.pho trenet.pho xavier.pho
}
