# Maintainer: Trevor Tilby <trevor dot tilby at gmail dot com>
# Contributor: whriedplanck

pkgname=powdertoy-bin
pkgver=96.2
pkgrel=3
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl-1.1' 'hicolor-icon-theme')
source=("https://powdertoy.co.uk/Download/powder-lin64.zip"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-16.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-24.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-32.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-48.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-128.png"
        "https://raw.githubusercontent.com/The-Powder-Toy/The-Powder-Toy/master/resources/icon/powder-256.png"
        powdertoy-tpt.desktop)
sha1sums=('1209697e762fffba5b50ba988709bf00d3bedf21'
          '95fb5926e31630fd641fb8333e81247679c02e8d'
          '42e72237f8eb1365006c8210062ac178669f30d0'
          'fdaa23068bb2df6eacfcb2329dd69f8d778c5355'
          '1a2db9ae652a291453a30106449e87a0bc731d28'
          '3dc5b06c0a826a333204ef1ffa9d73b2ee502c6f'
          'eeb8f46123450d333609ba5dc6e85927f2817676'
          'SKIP')

package() {
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/bin" powder
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-tpt.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  local icon_size
  for icon_size in 16 24 32 48 128 256; do
    install -Dm 644 "powder-${icon_size}.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/powder.png"
  done
}
