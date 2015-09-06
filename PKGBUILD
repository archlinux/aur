# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.0.28
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64')
url="https://www.digilentinc.com/WaveForms"
license=('custom')
depends=('desktop-file-utils' 'qt5-script' 'shared-mime-info' 'xdg-utils')
optdepends=('digilent.adept.runtime: Digilent hardware support')
options=('!strip')
install=${pkgname}.install
source_i686=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('a93661c35f645fb8df5e9698b947d2b7be2f46bc3e0ceac350d3b037293217cd')
sha256sums_x86_64=('5eaac2049021f33c0646d97ab4a5197eacea293cd40f6a954f4c502939e8025d')

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
