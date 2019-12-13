# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.12.1
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://reference.digilentinc.com/waveforms3"
license=('custom')
depends=('desktop-file-utils' 'digilent.adept.runtime' 'qt5-script' 'shared-mime-info' 'xdg-utils')
options=('!strip')
install=${pkgname}.install
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_armv6h=('766c00a5e83a7a55d6e9c6b6480153064892570c7d8b0ee712f9c592e8e06040')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('a4f2460acb6ce532b48d12e8f71c220afd389cc29e1985a2dcac9cc1d50cd8de')
sha256sums_x86_64=('86001723c7712089b7be0cc12e33881542a2e297c0e0b40b77031a6080af6c13')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
