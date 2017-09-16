# Maintainer: Tijn <t_ijn at yahoo dot com>
pkgname=brother-dcpl2540dn-lpr
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother DCP-L2540DN lpr drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadlist.aspx?c=nl&lang=nl&prod=dcpl2540dn_eu&os=127&flang=English"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc' 'bash' 'perl')
#optdepends=('brother-dcp7070dw-cups: cupswrapper.')
#changelog="${pkgname}.changelog"
source=(
  "http://download.brother.com/welcome/dlf101761/dcpl2540dnlpr-${pkgver/_/-}.i386.rpm"
  "http://support.brother.com/g/s/agreement/English_lpr/agree.html")
md5sums=(
  '71602bc0a8b2da87cb18216175bc09fb'
  '5a4a3172f6278922062aa6e1f43b0d92')

package() {
  cp -r ${srcdir}/var ${pkgdir}/
  cp -r ${srcdir}/opt ${pkgdir}/
  cp -r ${srcdir}/etc ${pkgdir}/
  install -D -m644 agree.html "${pkgdir}/usr/share/licenses/${pkgname}/EULA.html"
}
