# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=basemark
pkgver=1.1.0
pkgrel=2
pkgdesc="Basemark GPU - Graphics performance evaluation tool"
arch=('x86_64')
url="https://www.basemark.com/products/basemark-gpu/"
license=('custom')
depends=("libxinerama" "libxi" "xdg-utils" "hicolor-icon-theme" "freetype2" "libgl" "libxrandr" "libxcursor" "libcurl-compat" "openssl-1.0")
optdepends=("vulkan-icd-loader")
source=(https://cdn.downloads.basemark.com/BasemarkGPU-linux-${pkgver}.tar.gz
        ${pkgname} ${pkgname}.desktop ${pkgname}.png license.txt)
sha256sums=('4c6267b53a30845ec89b8d658c55a7f9b2238486b96197f66eaed4b73ee3bd33'
            'e45b53aec5d376cc2b26af49f640242251300a3b354661851c49094c520b3265'
            '99b4e6df0c45fd3ed71bd38c7de041d08bab45daf1e8cee183ccc070ae4b686f'
            '0f49324d4e1c761d1ef92e350a1ca667262659ecf98909c8b1d902f67dbad72b'
            '9a9228a9d95c67e0bbe22a73edd3f2087cc386d9e4df74ce18aa7b23172aeef9')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mv "${srcdir}/BasemarkGPU-linux-Free/"* "${pkgdir}/opt/${pkgname}"

  chmod +x "${pkgdir}/opt/${pkgname}/basemarkgpu"

  install -m644 -D "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m755 -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
