# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-migmix
pkgver=20130617
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and IPA."
arch=('any')
url="http://mix-mplus-ipa.osdn.jp/migmix/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59021/migmix-1m-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59021/migmix-1p-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59021/migmix-2m-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59021/migmix-2p-${pkgver}.zip)
md5sums=('44cf7f975ddddeff2f4cdcbeabb953fe'
         'eb6dee30c80f629d966bf91cc62bb072'
         '1b412d0ec755bdff7b13ab9256917a32'
         '075410c69f728729a20c84ee761fd853')
sha256sums=('c136e13059aa5ad071c1f88033b45bf86c8f1dda003ac7b6077b4c17c6d9532b'
            '13d131ecc295823bace9e4d53a689ae26f21f18335a004c1a3d987a273467833'
            '0a28eb6ec58e35399332b7b8d0b1f6298e36ec1830d65fb4ab83a036e7e13b08'
            '639bf85bca573d6d3be5487c8612dac88586d37c823ddb002584f59dcf7f3aa8')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 */*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 migmix-1m-*/migmix-README.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 migmix-1m-*/ipag00303/IPA_Font_License_Agreement_v1.0.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
