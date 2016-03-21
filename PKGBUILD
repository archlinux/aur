# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.2.6
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
sha256sums_armv6h=('3e428e4b04b5b9ca9100211d0c7450f6c549b3038b6b59fda316fa184e67b04b')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('f71d20fb694808bfb64c8b0b456aae15fda212be96a87da23e7e3b6d2c9cfc12')
sha256sums_x86_64=('bf93ea414cb5ed201bc018c2e47adc9d5e963af9c22446ab6042f2926198ecf1')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
