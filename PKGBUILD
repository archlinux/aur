# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Maintainer: Matthew Blankenbehler <spectrino3d@gmail.com>
# Contributor: Julius de Jeu <julius@voidcorp.nl>

pkgname=powder-toy-jacob1-bin
pkgver=58.2
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat! Modded version by Jacob1"
arch=('x86_64')
url='https://powdertoy.co.uk/Discussions/Thread/View.html?Thread=11117'
license=('GPL3')
depends=('openssl' 'hicolor-icon-theme')
conflicts=("powder-toy-jacob")
provides=("powder-toy-jacob")
source=("${pkgname}-${pkgver}.tar.gz::https://starcatcher.us/TPT/mod/Older/Jacob1's%20Mod%20ver%20${pkgver}%20linux64.zip"
        "powder-jacobsmod.png::https://static.powdertoy.co.uk/avatars/jacob1.256.png"
        "powdertoy-jacobsmod.desktop")
sha256sums=('cb918ffaa4ae8bb5666584cc79f0f6982e719e28de5022bcde549b5a5d27551f'
            '9d269c19ea49c20e0c1e060d8508b0c0c39a32d042d7dc6d1d5cc72d50e674de'
            '6d720a85267e2a4dd59fe6e6a89abbd6eaa0e9f3881f12811a5a16733fa86afa')

prepare(){
  mv "${srcdir}/Jacob1's Mod" "${srcdir}/powder-jacobsmod"

  mv "${srcdir}/README" "${srcdir}/README.md"
  mv "${srcdir}/CHANGELOG" "${srcdir}/CHANGELOG.md"
}

package(){
  cd "${srcdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" powder-jacobsmod
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-jacobsmod.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" CHANGELOG.md
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  install -Dm 644 "powder-jacobsmod.png" -t "${pkgdir}/usr/share/icons/"
}
