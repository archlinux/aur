# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=platformflashtoollite
pkgver=5.5.2.0
pkgrel=1
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/android-ia/downloads/intel-platform-flash-tool-lite'
license=('custom')
depends=('libusb-compat' 'libudev0')
source=("https://download.01.org/android-ia/tools/platformflashtool-lite/${pkgver}/${pkgname}_${pkgver}_linux_x86_64.deb")
md5sums=('67e13456df4ad2b2a5fe6afc1dca660a')

package() {
  cd "${srcdir}"

  tar xvf data.tar.gz
  cp -r "${srcdir}/usr" "${pkgdir}"

  install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/Intel_Development_Tools_Limited_License_Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
