# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.3.3
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/waveforms3"
license=('custom')
depends=('desktop-file-utils' 'qt5-script' 'shared-mime-info' 'xdg-utils')
optdepends=('digilent.adept.runtime: Digilent hardware support')
options=('!strip')
install=${pkgname}.install
source_armv6h=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_armv6h=('7055c381c922a22fb40f48975b653e8de0a92094e6cdc6eb1c4e3b3e4b7bc389')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('36947c4d0bd4d1470e708d39b5fb0e4e4996bf859cccc6240fd173b3e6d82a86')
sha256sums_x86_64=('142088f17129e302d3f1a3bbb4cdd42ca64b8488d61e4b292c3bc00d863cccef')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
