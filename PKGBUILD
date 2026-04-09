# Maintainer: Sinyria <sinyria ad speed dod at>
# replace ad and dod accordingly (antispam)
_pkgname=new-computer-modern
pkgname=otf-${_pkgname}
pkgver=7.1.1
pkgrel=1
pkgdesc="NewComputerModern provides a huge extension of Knuth's ComputerModern fonts in 10 and 8pt including a Book weight. It supports many more languages, extends the possibilities for Latin, and includes Mathematics in Regular and Book weight."
arch=('any')
depends=('fontconfig')
url='https://git.gnu.org.ua/newcm.git/'
source=("https://download.gnu.org.ua/release/newcm/newcm-${pkgver}.txz"
        "http://tug.org/fonts/licenses/GUST-FONT-LICENSE.txt")
sha256sums=('27ba53922256ebb339a9b1e4e07252ee8e832738b4be6228e4adcaa9a9a76583'
            '49ea6cb9257bbee0a3979c48a774cd221550ac1c20c95549efe45fc99cc18050')
license=('custom:GFL')

package() {
  install -m644 -Dt "${pkgdir}/usr/share/fonts/${_pkgname}/" \
    "${srcdir}"/newcm-${pkgver}/otf/*.otf
  install -m644 -Dt "${pkgdir}/usr/share/doc/${_pkgname}/" \
    "${srcdir}"/newcm-${pkgver}/doc/*.pdf
  install -Dm644 \
    "${srcdir}/GUST-FONT-LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/GFL.txt"
}