# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.3.7
pkgrel=2
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
sha256sums_armv6h=('16894c83e610f4704817a35dedd93b237c188834011a42da1ee29d4da919eeb5')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('974e3e0d985edf0c4c0f00d5f340d9d0b6ea4e9049d748296f73dff6e8593fe7')
sha256sums_x86_64=('ebbf6ff6b6e92759ad47ff12145c8927d14bc699dfa3da20c1ab57e877bc85a3')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
