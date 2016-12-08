# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.4.7
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/waveforms3"
license=('custom')
depends=('desktop-file-utils' 'digilent.adept.runtime' 'qt5-script' 'shared-mime-info' 'xdg-utils')
options=('!strip')
install=${pkgname}.install
source_armv6h=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_armv6h=('aad2bcedab902c45ae460f8f150ea895272d961ebc5dd331987758e97ae96a9e')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('1987eec1e65770e7d99bd80ba64cd932feeaa0bf19185bc2d3f3a33f036bf27e')
sha256sums_x86_64=('dd37cdc06230c0ee969b60817204e1acd8a34b5f6e6917557e8a92c67b673cdd')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
