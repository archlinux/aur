# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-migmix
pkgver=20200307
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and IPA."
arch=('any')
url="https://mix-mplus-ipa.osdn.jp/migmix/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/dl/mix-mplus-ipa/migmix-1m-${pkgver}.zip
        https://osdn.net/dl/mix-mplus-ipa/migmix-1p-${pkgver}.zip
        https://osdn.net/dl/mix-mplus-ipa/migmix-2m-${pkgver}.zip
        https://osdn.net/dl/mix-mplus-ipa/migmix-2p-${pkgver}.zip)
md5sums=('3a2feb2575f9489a0c4f69471803558d'
         '23d5be6cd980713e1abe65c8f52ed631'
         '9880b534101597939e0258bb736d10e0'
         'cb3766ad6339d332eee4fecb41e1884d')
b2sums=('27570839c5b120b9a65f481394ab15a84c01211024ccf68139d57e7e2f63687fb5de90e77fd4091a89a13153b57b33308efd1777d3ad3df550329086034d3e67'
        '076a810e7f4efd9947a80ba8000c74e2f55fc9afe84d47bb6b837cf5b7c44d13edba06f8fde5c3e911e134345cab05ccd15d64e15a327f247b7212ef4ea8c484'
        '8765ebad60f0fc5c03d8575d4c4528a1507abefd9f9d658f0b1726f6bd5e6ebe2e45c0f483d5164925df9ef7e57431452c51a19b36000253ff03f4b46e2e38c0'
        '5503e391b955a062d5cd617eed064b9ec4e80e5188032838a4fb1e80852120ef7ab0a125aa4506019b05e067fdd443e56544976b2f04bfc2a595033cc69522cb')

package() {
  cd "${srcdir}"

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 */*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 migmix-1m-${pkgver}/migmix-README.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 migmix-1m-${pkgver}/ipag00303/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
