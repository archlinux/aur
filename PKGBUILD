# Maintainer: Kenneth Stier <kenny at millhousen dot tech>

pkgname=rollo-printer
pkgver=1.0
pkgrel=1
pkgdesc='Rollo (Beeprt BY-242) USB Printer Driver for Linux'
arch=('x86_64')
url='https://www.rollo.com/driver-linux/'
license=('custom')
depends=('cups')
source=('https://www.rollo.com/driver-dl/beta/rollo-driver-ubuntu_x86_64_v1.0.2.tar.gz')
sha512sums=('e3d382bf0dd6d08ebb023b7270e50f09a09021c78bf387e9a1e172e5f965e3b53dc6e9144cd18b8d91024faa62390a609dbcfe506d11cb4a9308688342d53fb3')


package() {

  # install filter
  mkdir -p "${pkgdir}"/usr/lib/cups/filter
  install -m755 "${srcdir}"/rollo-driver-ubuntu_x86_64_v1.0.2/ubuntu_x86_64_v1.0.2/rastertolabelbeeprt "${pkgdir}"/usr/lib/cups/filter

  # install ppd
  mkdir -p "${pkgdir}"/usr/share/cups/model/beeprt
  install -m644 "${srcdir}"/rollo-driver-ubuntu_x86_64_v1.0.2/ubuntu_x86_64_v1.0.2/ppd/ThermalPrinter.ppd "${pkgdir}"/usr/share/cups/model/beeprt
  
}
