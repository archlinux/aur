# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-meguri
pkgver=20101113a
pkgrel=4
pkgdesc="Modified IPA and M+ fonts for Japanese"
arch=('any')
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://downloads.sourceforge.net/mdk-ut/meguri-fonts-${pkgver}.tar.lzma)
md5sums=('fc3352bbea9712ad685ccfc43333e8ad')
sha256sums=('77599ce97a2ead6e7aa714d05855c790ed4664e88fc79cf6eab9c579eb2e1c09')

package() {
  cd ${srcdir}/meguri-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-ipa/IPA_Font_License_Agreement_v1.0.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
