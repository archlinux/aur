# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-migmix
pkgver=20150712
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and IPA."
arch=('any')
url="http://mix-mplus-ipa.osdn.jp/migmix/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=(http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63544/migmix-1m-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63544/migmix-1p-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63544/migmix-2m-${pkgver}.zip
        http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63544/migmix-2p-${pkgver}.zip)
md5sums=('3de659097dc4d6b156040c5c25dc4cf9'
         '6e68c94b3a9cd8e549d32a5edde8c7a5'
         'f603d14c9ab304c98946d26870991bfb'
         'd9deb63a39a0d44a5cc1b5eeea278b84')
sha256sums=('ac91394f3687315fb2727f8ee2b8ef70c6801d0b674dfc991912400eb3e7a344'
            'd71aa59146c600bc2f22de87495fe0127741fbb692736be0e1fe454e128c9d76'
            'a8639f277f5a2a2c78c20d05d2a6fb0977116193dcb708997a04080e9615882d'
            'b9289b61661ed2c158230651a963724618620607b060ae9701f1c5bbedfdee7f')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 */*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 migmix-1m-*/migmix-README.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 migmix-1m-*/ipag00303/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
