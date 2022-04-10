# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.18.1
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://reference.digilentinc.com/waveforms3"
license=('custom')
depends=('desktop-file-utils' 'digilent.adept.runtime' 'qt5-multimedia' 'qt5-script' 'shared-mime-info' 'xdg-utils')
options=('!strip')
install=${pkgname}.install
source_aarch64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('ed9d6e2f4a57869d2b9d9b43cd5da1a98249633adfa3dc4425078d048c64fcdb')
sha256sums_armv6h=('cb81f3f5e837c8b34e519cf80d53685f32d6779e272e3121103e04a447c63899')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('de5005076838bb27f5f42fbe926c7facd3ddde1e576b5d9f538a3ecdf6d93134')
sha256sums_x86_64=('f4c7207e52391e0abf40cb70ea52aedfd329ed02b059c8690580b47746ca58ba')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
