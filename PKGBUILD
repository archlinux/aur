# Maintainer: Trevor Tilby <trevor dot tilby at gmail dot com>
# Contributor: whriedplanck

pkgname=powdertoy-bin
pkgver=96.2
pkgrel=4
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl-1.1' 'hicolor-icon-theme')
source=("https://powdertoy.co.uk/Download/powder-lin64.zip"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon_exe.svg"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_16.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_32.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/generated_icons/icon_exe_48.png"
        powdertoy-tpt.desktop)
        # backup links if they break again
        # "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/e5c88f154a7613bcced916b17baeccc7ce016f4f/resources/icon_exe.svg"
        # "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/e5c88f154a7613bcced916b17baeccc7ce016f4f/resources/generated_icons/icon_exe.png"
        # "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/e5c88f154a7613bcced916b17baeccc7ce016f4f/resources/generated_icons/icon_exe_16.png"
        # "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/e5c88f154a7613bcced916b17baeccc7ce016f4f/resources/generated_icons/icon_exe_32.png"
        # "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/e5c88f154a7613bcced916b17baeccc7ce016f4f/resources/generated_icons/icon_exe_48.png"
sha1sums=('1209697e762fffba5b50ba988709bf00d3bedf21'
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

  local icon_size
  for icon_size in 16 32 48; do
    install -Dm 644 "icon_exe_${icon_size}.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/powder.png"
  done
  install -Dm 644 "icon_exe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/powder.png"
  install -Dm 644 "icon_exe.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/powder.png"
}
