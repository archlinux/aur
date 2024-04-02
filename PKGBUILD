# Maintainer: griffi-gh <prasol258 gmail com>
# Contributor: Trevor Tilby <trevor dot tilby at gmail dot com>
# Contributor: whriedplanck

pkgname=powdertoy-bin
pkgver=98.2.365
pkgrel=2
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://powdertoy.co.uk/Download/Builds/Build-365/powder%20linux64.zip"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon_exe.svg"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_16.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_32.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_48.png"
        powdertoy-tpt.desktop)
sha1sums=('43db9e56b256de2c6b4aeb0466b4ccf61ce1a8ae'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

package() {
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/bin" powder
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-tpt.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  local icon_size
  for icon_size in 16 32 48; do
    install -Dm 644 "icon_exe_${icon_size}.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/powder.png"
  done
  install -Dm 644 "icon_exe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/powder.svg"
  install -Dm 644 "icon_exe.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/powder.png"
}
