# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brad Conte <brad AT bradconte.com>

set -u
pkgname='planetmule'
pkgver='1.3.6'
pkgrel='1'
pkgdesc='A free remake of, and tribute to, the 26 year old original role-playing game M.U.L.E.'
arch=('any')
url='http://planetmule.com'
license=('Freeware')
#depends=('openjdk6')
depends=('jre7-openjdk')
source=("http://mule-downloads.s3.amazonaws.com/mule_linux_${pkgver}.tar.gz" 'planetmule' 'planetmule.desktop')
sha256sums=('52cbdafd680b02465538df7a6e64c8f258ea27ac62fa8ee91a6706ce0d87d8fc'
            '4239af5a9993fd7831b01317ed8229ce9ead27bea12f7a037de1698228d15f23'
            '293d79ff10950f90a0ecbd6e37bdd0e0db4c66b0c4d42405e45e176d26407b52')

package() {
  set -u
  install -d "${pkgdir}/opt"
  mv "${srcdir}/mule/" "${pkgdir}/opt/mule/"
  install -Dpm755 "${srcdir}/planetmule" -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${srcdir}/planetmule.desktop" -t "${pkgdir}/usr/share/applications/"
  set +u
}
set +u
