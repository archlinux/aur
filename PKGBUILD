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

if [[ $CARCH == 'i686' ]]; then
  source=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_i386.deb")
  sha1sums=('1d3997d079eb92e3bc28a0b2ad2e80fc487a38bd')
  sha256sums=('a93661c35f645fb8df5e9698b947d2b7be2f46bc3e0ceac350d3b037293217cd')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("https://s3-us-west-2.amazonaws.com/digilent/Software/Waveforms3Beta/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
  sha1sums=('099a807a348f214366e22984f29a5ceee640b6cc')
  sha256sums=('5eaac2049021f33c0646d97ab4a5197eacea293cd40f6a954f4c502939e8025d')
fi

package() {
  # Extract
  tar -xzf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
