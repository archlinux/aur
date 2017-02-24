# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=phoneflashtoollite
pkgver=5.2.4.0
pkgrel=3
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/android-ia/downloads/intel-phone-flash-tool-lite'
license=('custom')
depends=('libusb-compat' 'libudev0')

source=("https://download.01.org/android-ia/tools/phoneflashtool-lite/5.2.4.0/${pkgname}_${pkgver}_linux_x86_64.deb"
        'LICENSE')

sha256sums=('1218589ea7444fecf463ec69a12635571739f955c3be02f7a571fd413d564fbd'
            '781ca17bec886438921d5942ba6d493701bc2e92acb2e640fdb4bece54c29b14')

package() {
  cd "${srcdir}"

  tar xvf data.tar.gz
  cp -r "${srcdir}/usr" "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
