pkgname=lib32-libftd2xx
_pkgname=libftd2xx
pkgver=1.1.12
pkgrel=2
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('x86_64')
url="http://www.ftdichip.com/"
license=('GPL')
depends=('glibc' 'libusb>=1.0.8' 'libftd2xx' 'lib32-libusb>=1.0.8')
options=(!strip)
source=(http://www.ftdichip.com/Drivers/D2XX/Linux/${_pkgname}${pkgver}.tar.gz)
md5sums=('351635dc393fa24447c8dac95c321cbc')

package() {
  install -d "${pkgdir}"/usr/lib32

  install -Dm755 "${srcdir}"/release/build/i386/${_pkgname}.so.${pkgver} "${pkgdir}"/usr/lib32/${_pkgname}.so.${pkgver}
  ln -sf /usr/lib/${_pkgname}.so.${pkgver} "${pkgdir}"/usr/lib32/${_pkgname}.so
  
  install -Dm644 "${srcdir}"/release/build/i386/${_pkgname}.a "${pkgdir}"/usr/lib32/${_pkgname}.a
}
