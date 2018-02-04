# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.7.5
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
sha256sums_armv6h=('39d66e8f91e6fdb66cc41764267a70fc93c5eef23f0bc2b5319e72db6e0cbfc0')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('7fba3eb37ce93d2852b1913ebbad82d662e367df0d68b52aba2c76ad0e46be8b')
sha256sums_x86_64=('53aefbffde0a105224fc36e6cbc5d1c9cc64d755feacfbed7068bbad3287a21c')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
