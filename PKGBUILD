# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=rustrover-eap
pkgver=232.9921.46
pkgrel=4
pkgdesc="Rust IDE by JetBrains"
arch=('x86_64' 'aarch64')
depends=('rust-src')
options=('!strip')
url="https://www.jetbrains.com/rust/"
license=('custom:jetbrains')
source=("${pkgname}.desktop" 'jetbrains-eap-3.3.docx')
source_x86_64=("${pkgname}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/rustrover/RustRover-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('87a122544f85c7334a23e0b5051b09d03d975f93f151e735cd65bdeef5093bc1'
            'c05432334b1df86156e2fb0021b27ab8615bb31be26d60f96bf804333bef5685')
sha256sums_x86_64=('5a51bcae179467e9c6440bc0c31bffd27c6fc58d593a0cbecd5aeb51508d27b6')
sha256sums_aarch64=('ead8356bd0e2faff336957e774efa707f5567648d1650270988aa73ca802782c')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cp -a "RustRover-${pkgver}/." "${pkgdir}/opt/${pkgname}"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/rustrover.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 "jetbrains-eap-3.3.docx" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/bin/rustrover.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
