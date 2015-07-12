# Contributor: noonov <noonov@gmail.com>
# Contributor: gasuketsu02 <gasuketsu02@gmail.com>

pkgname=ttf-migu
pkgver=20150712
pkgrel=1
pkgdesc="Good looking Japanese TrueType font by mixing M+ and IPA."
arch=('any')
url="http://mix-mplus-ipa.osdn.jp/migu/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=("http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63545/migu-1c-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63545/migu-1m-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63545/migu-1p-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/63545/migu-2m-${pkgver}.zip")
md5sums=('cfff8f417f4d891f11afde0e8076bbbc'
         '80046949f85da8177d6f1bb319f744f8'
         'ed54bf90490288ecd513f188f48f88d7'
         '6dac0f64af30cfb006e27d071cfb9f97')
sha256sums=('62aba11af4e5343b5437c866e3747366d084b63885539c92636222d2978999f1'
            'd4c38664dd57bc5927abe8f4fbea8f06a8ece3fea49ea02354d4e03ac6d15006'
            '9406399eeb94bb98f0844c2cd6bc94c390d994e6705af56e550d27f2a30b4bd5'
            '659a6a121dadb6eac78369b9d129e2ec77a09fa292ca20932e42a5c753874297')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 */*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 migu-1c-*/migu-README.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 migu-1c-*/ipag00303/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
