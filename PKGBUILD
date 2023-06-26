# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.19.5
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://digilent.com/reference/software/waveforms/waveforms-3/start"
license=('custom')
depends=('desktop-file-utils' 'digilent.adept.runtime' 'qt5-multimedia' 'qt5-script' 'shared-mime-info' 'xdg-utils')
options=('!strip')
install=${pkgname}.install
source_aarch64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('ef38503dda5633836dcd3c720cd3a8027471e47ab03d520fd739a8fbc5955211')
sha256sums_armv6h=('fd78be636786c69c12a26dd46ad6215560e80de44b7713c2ffbb637b6665908a')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('d672d0d6de14e91c09a8aef4b081fbc18deb1308c4583073046efbc81deac794')
sha256sums_x86_64=('011ce23f430119b1a2d3a649a2f877525a30c607af00c80920038251cc8e8b89')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
