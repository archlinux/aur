# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.17.1
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
sha256sums_aarch64=('caccc1e769731aab59f9dd8c48d5ae8b8cd9bde2dbd804ccce5d4d267f5c60b4')
sha256sums_armv6h=('bcc984c33cb67db4514b77f914fd78fdfadfa8dd75848649be2278c3a8c645d4')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('fb28b0eaf3d8f3250eaccfe59a77d3773493f183b70fe8cb6a775183956df780')
sha256sums_x86_64=('a13f14fe3310740967815a87c4c2b9d2a66e0856c16a507b9be5dc145bd8a531')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
