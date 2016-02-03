# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.1.5
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64')
url="https://reference.digilentinc.com/waveforms3"
license=('custom')
depends=('desktop-file-utils' 'qt5-script' 'shared-mime-info' 'xdg-utils')
optdepends=('digilent.adept.runtime: Digilent hardware support')
options=('!strip')
install=${pkgname}.install
source_i686=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('0288f3aceccde68fff9c92242fc5861084e4e91d175c26491a2325e55937049b')
sha256sums_x86_64=('62f8f3b2a36a8f484a5c191dbc101d2d07f1f7c380b5fc0cc26ddaba79f00172')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
