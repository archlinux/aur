# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-meguri
pkgver=20101113a
pkgrel=7
pkgdesc="Modified IPA and M+ fonts for Japanese"
arch=('any')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/users/utuhiro/pf/utuhiro/dl/meguri-fonts-${pkgver}.tar.lzma)
md5sums=('fc3352bbea9712ad685ccfc43333e8ad')
b2sums=('c425d14a4d0455af214e0b04e5a16163129c7802d30e13a0f95eebde0169292e93a2fb4d302db4dfe1dd354196b3aa88821b516d9f918d2b2384347ba308ea53')

package() {
  cd ${srcdir}/meguri-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-ipa/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
