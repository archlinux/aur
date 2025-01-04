# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Maintainer: griffi-gh <prasol258 gmail com>
# Contributor: Trevor Tilby <trevor dot tilby at gmail dot com>
# Contributor: whriedplanck

pkgname=powdertoy-bin
_pkgver=99.0
_pkgbuild=377
pkgver="${_pkgver}.${_pkgbuild}"
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl' 'hicolor-icon-theme')
conflicts=("powder-toy")
provides=("powder-toy")
source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://powdertoy.co.uk/Download/Builds/Build-${_pkgbuild}/powder%20linux64.zip"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon_exe.svg"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_16.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_32.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_48.png"
        powdertoy.desktop)
sha256sums=('48fe4461670cc24923d4b9dee4e1f51df7d34c12465bbd1c3d6b968b03f6ce02'
            'da002be13501b7d2ef0d0d470f35bc37d6f90805a7f084a00aa66f7c37ce2f81'
            '7f4e5eaff3a84ad3973cc2d7aa0b0d8817559a500aecff84decc7a06357c11b3'
            '26fea33bd84a7b3c6846567eff7996a1e96470d4083ca2de6467753cc971790a'
            '97afd3c283cc8847e3f35efe6011bf9eb969ccd8ffde331728ed7b6d9d3d1762'
            'e21498e46a3f1642b5d378ee0e63a3eb6f930778a04a25062ca8c781eab4c314'
            '1938a97aeebe44ac1d2712156cc2bd3d73d3b9edf41d38460c26f7a012b4c474')

package() {
  cd "${srcdir}"

  install -Dm 755 -t "${pkgdir}/usr/bin" powder
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  local icon_size
  for icon_size in 16 32 48; do
    install -Dm 644 "icon_exe_${icon_size}.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/powder.png"
  done

  install -Dm 644 "icon_exe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/powder.svg"
  install -Dm 644 "icon_exe.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/powder.png"
}
