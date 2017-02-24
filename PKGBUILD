# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=platformflashtoollite
pkgver=5.5.2.0
pkgrel=2
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/android-ia/downloads/intel-platform-flash-tool-lite'
license=('custom')
depends=('libusb-compat' 'libudev0')
source=("https://download.01.org/android-ia/tools/platformflashtool-lite/${pkgver}/${pkgname}_${pkgver}_linux_x86_64.deb")
sha256sums=('276349d9b76e3437dd472d40eecf381dae863da14bb952dcebd2ecfdc2338580')

package() {
  cd "${srcdir}"

  tar xvf data.tar.gz
  cp -r "${srcdir}/usr" "${pkgdir}"

  install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/Intel_Development_Tools_Limited_License_Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
