# Contributor: noonov <noonov@gmail.com>
# Contributor: gasuketsu02 <gasuketsu02@gmail.com>

pkgname=ttf-migu
pkgver=20130617
pkgrel=1
pkgdesc="Good looking Japanese TrueType font by mixing M+ and IPA."
arch=('any')
url="http://mix-mplus-ipa.osdn.jp/migu/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # keihanna, jaist, iij, osdn
source=("http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1c-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1p-${pkgver}.zip"
        "http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-2m-${pkgver}.zip")
md5sums=('a3d6bf302e04e2be30300cc7d28960c5'
         '890d76746013ecf1a0c56276c1836a5f'
         '3b3e18cdb1ebd8105be82244e04a7087'
         '281e9d4021aa462fa29cd8859d544373')
sha256sums=('3defd9a68e4f3c406b0ccf3dbb978006fa03ccdd7ef6e822fa8115c7baf22a4e'
            'c52025471b560e5aba73ec2327a160d6e514def05964056dbb1a8409e5870b45'
            '2c59928b41508a8f4871edc61cdb2259ee8bb078e915c11cda3ca3a54a3a5a19'
            '25092541e927bbebc094f9c1d7cfaec3e8e2c7a997c360c507a3433ed11e8278')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 */*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 migu-1c-*/migu-README.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 migu-1c-*/ipag00303/IPA_Font_License_Agreement_v1.0.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
