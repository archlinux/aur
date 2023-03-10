# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=basemark
pkgver=1.2.3
pkgrel=4
pkgdesc="Basemark GPU - Graphics performance evaluation tool"
arch=('x86_64')
url="https://www.basemark.com/products/basemark-gpu/"
license=('custom')
depends=("xdg-utils" "libgl" "libxrandr" "gtk3" "alsa-lib" "mesa" "nss" "vulkan-icd-loader" "openssl-1.1")
source=(https://cdn.downloads.basemark.com/BasemarkGPU-linux-x64-${pkgver}.tar.gz
        ${pkgname} ${pkgname}.desktop ${pkgname}.png license.txt)
sha256sums=('2d7431a7a32e89db52c2d2782f2d2ac1c91ff77ff5d1c8fcdc18c21ff65b9c9b'
            'e45b53aec5d376cc2b26af49f640242251300a3b354661851c49094c520b3265'
            '99b4e6df0c45fd3ed71bd38c7de041d08bab45daf1e8cee183ccc070ae4b686f'
            '0f49324d4e1c761d1ef92e350a1ca667262659ecf98909c8b1d902f67dbad72b'
            '9a9228a9d95c67e0bbe22a73edd3f2087cc386d9e4df74ce18aa7b23172aeef9')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mv "${srcdir}/basemarkgpu-${pkgver}/"* "${pkgdir}/opt/${pkgname}"

  chmod +x "${pkgdir}/opt/${pkgname}/basemarkgpu"

  install -m644 -D "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m755 -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
